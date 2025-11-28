#!/usr/bin/env python3
import json
import os
import sys
from datetime import datetime, timezone
from pathlib import Path

import requests

ROOT = Path(__file__).resolve().parents[1]
DATA_DIR = ROOT / "_data"
PUBS_PATH = DATA_DIR / "publications.json"
META_PATH = DATA_DIR / "publications_meta.json"
CONFIG_PATH = ROOT / "_config.yml"

SERPAPI_ENDPOINT = "https://serpapi.com/search.json"


def _extract_scholar_config():
    '''
    Minimal YAML reader (avoids extra deps). We only read:
      scholar:
        author_id: "..."
        hl: "en"
        sort: "pubdate"
    '''
    if not CONFIG_PATH.exists():
        return {"author_id": None, "hl": "en", "sort": "pubdate"}

    lines = CONFIG_PATH.read_text(encoding="utf-8").splitlines()
    in_scholar = False
    cfg = {"author_id": None, "hl": "en", "sort": "pubdate"}

    for line in lines:
        raw = line.rstrip("\n")
        if raw.strip().startswith("#") or not raw.strip():
            continue
        if raw.startswith("scholar:"):
            in_scholar = True
            continue
        if in_scholar and not raw.startswith("  "):
            in_scholar = False
        if in_scholar and ":" in raw:
            key, val = raw.strip().split(":", 1)
            val = val.split("#", 1)[0].strip()
            # Remove surrounding quotes (if any)
            val = val.strip().strip('"').strip("'")
            if key in cfg:
                cfg[key] = val

    return cfg


def fetch_all_articles(api_key: str, author_id: str, hl: str = "en", sort: str = "pubdate"):
    all_articles = []
    start = 0
    num = 100  # max supported by SerpApi for this engine

    while True:
        params = {
            "engine": "google_scholar_author",
            "api_key": api_key,
            "author_id": author_id,
            "hl": hl,
            "sort": sort,
            "start": start,
            "num": num,
        }
        r = requests.get(SERPAPI_ENDPOINT, params=params, timeout=60)
        r.raise_for_status()
        payload = r.json()

        articles = payload.get("articles") or []
        if not articles:
            break

        for a in articles:
            title = (a.get("title") or "").strip()
            if not title:
                continue

            year = a.get("year")
            try:
                year_int = int(year) if year else None
            except Exception:
                year_int = None

            cited_by = None
            cb = a.get("cited_by") or {}
            if isinstance(cb, dict):
                cited_by = cb.get("value")

            all_articles.append({
                "title": title,
                "authors": (a.get("authors") or "").strip(),
                "venue": (a.get("publication") or "").strip(),
                "year": year_int,
                "cited_by": cited_by,
                "link": (a.get("link") or "").strip(),
                "citation_id": (a.get("citation_id") or "").strip(),
            })

        if len(articles) < num:
            break
        start += num

    # De-duplicate (citation_id preferred)
    seen = set()
    dedup = []
    for p in all_articles:
        key = p["citation_id"] or f'{p["title"]}::{p.get("year")}'
        if key in seen:
            continue
        seen.add(key)
        dedup.append(p)

    # Sort: year desc, cited_by desc, title asc
    def sort_key(p):
        year = p["year"] if p["year"] is not None else -1
        cited = p["cited_by"] if isinstance(p["cited_by"], int) else -1
        return (-year, -cited, p["title"].lower())

    dedup.sort(key=sort_key)
    return dedup


def main():
    api_key = os.environ.get("SERPAPI_API_KEY", "").strip()
    if not api_key:
        print("ERROR: SERPAPI_API_KEY is not set.", file=sys.stderr)
        print("Set it as a GitHub Actions secret named SERPAPI_API_KEY.", file=sys.stderr)
        return 1

    scholar_cfg = _extract_scholar_config()
    author_id = scholar_cfg.get("author_id")
    if not author_id:
        print("ERROR: scholar.author_id is missing in _config.yml", file=sys.stderr)
        return 1

    hl = scholar_cfg.get("hl") or "en"
    sort = scholar_cfg.get("sort") or "pubdate"

    pubs = fetch_all_articles(api_key=api_key, author_id=author_id, hl=hl, sort=sort)

    DATA_DIR.mkdir(parents=True, exist_ok=True)
    PUBS_PATH.write_text(json.dumps(pubs, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    now = datetime.now(timezone.utc).replace(microsecond=0).isoformat()
    meta = {
        "updated_at_utc": now,
        "source": "SerpApi google_scholar_author",
        "author_id": author_id,
        "count": len(pubs),
        "scholar_profile": f"https://scholar.google.com/citations?hl={hl}&user={author_id}",
    }
    META_PATH.write_text(json.dumps(meta, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    print(f"Wrote {len(pubs)} publications to {PUBS_PATH}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
