---
layout: page
title: Publications
subtitle: Auto-synced from Google Scholar (SerpApi)
permalink: /publications/
---

<div class="notification is-light">
  <strong>Auto-update:</strong> this page is built from <code>_data/publications.json</code>. A GitHub Action updates it on a schedule (and you can run it manually).
</div>

{% assign meta = site.data.publications_meta %}
{% if meta and meta.updated_at_utc %}
<p class="is-size-7 has-text-grey">Last updated (UTC): {{ meta.updated_at_utc }}</p>
{% endif %}

{% assign pubs = site.data.publications | sort: "year" | reverse %}
{% if pubs == nil or pubs.size == 0 %}
<p>Publications have not been synced yet. Configure <code>SERPAPI_API_KEY</code> in your repo secrets and run the workflow “Update publications”.</p>
{% else %}
  {% assign grouped = pubs | group_by: "year" | sort: "name" | reverse %}
  {% for g in grouped %}
    <h2 class="title is-4 mt-5">{{ g.name }}</h2>
    {% assign items = g.items | sort: "cited_by" | reverse %}
    {% for p in items %}
      <div class="pub-item mb-3">
        <div><strong>{{ p.title }}</strong></div>
        <div class="pub-meta">
          {{ p.authors }}{% if p.venue %}. <em>{{ p.venue }}</em>{% endif %}
          {% if p.year %} ({{ p.year }}){% endif %}
        </div>
        <div class="mt-2">
          {% if p.link %}<a href="{{ p.link }}" target="_blank" rel="noopener">Link</a>{% endif %}
          {% if p.citation_id %}<a class="ml-3" href="https://scholar.google.com/citations?view_op=view_citation&user={{ site.scholar.author_id }}&citation_for_view={{ p.citation_id }}" target="_blank" rel="noopener">Scholar</a>{% endif %}
          {% if p.cited_by %}<span class="ml-3">Cited by {{ p.cited_by }}</span>{% endif %}
        </div>
      </div>
    {% endfor %}
  {% endfor %}
{% endif %}
