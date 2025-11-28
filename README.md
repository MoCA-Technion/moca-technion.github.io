# MoCA Lab Website (Jekyll + Bulma Clean Theme)

This repo is a low-maintenance academic/lab website:
- Markdown pages (+ LaTeX via MathJax)
- GitHub Pages deployment via GitHub Actions
- Automatic publication sync from Google Scholar using SerpApi

## 1) Deploy to GitHub Pages
1. Create a new GitHub repository (e.g., `moca-lab`).
2. Upload the contents of this folder (or push with git).
3. In GitHub: **Settings → Pages**
   - **Build and deployment → Source:** select **GitHub Actions**
4. Push to `main`. The workflow **Deploy Jekyll site to GitHub Pages** will publish the site.

### baseurl / url
- If your site is `https://<username>.github.io/<repo>`, set in `_config.yml`:
  - `url: "https://<username>.github.io"`
  - `baseurl: "/<repo>"`
- If your site is `https://<username>.github.io`, keep `baseurl: ""`.

## 2) Add/edit content
All pages are Markdown at the repo root:
- `index.md`
- `research.md`
- `people.md`
- `join.md`
- `contact.md`
- `publications.md` (renders from `_data/publications.json`)

Navigation lives in `_data/navigation.yml`.

### LaTeX
Use inline math `$...$` and display math `$$...$$`.

## 3) Automatic publications (SerpApi -> Google Scholar)
This repo includes:
- Script: `scripts/update_publications.py`
- Workflow: `.github/workflows/update-publications.yml`

### Setup
1. Create a SerpApi account and get an API key.
2. In GitHub: **Settings → Secrets and variables → Actions**
   - Add secret: `SERPAPI_API_KEY`
3. Google Scholar author id is set in `_config.yml`:
   - `scholar.author_id: "lEg_t6kAAAAJ"`

### Run it
- Manually: **Actions → Update publications → Run workflow**
- Automatically: weekly (cron in the workflow)

When the workflow updates `_data/publications.json`, it commits to `main`,
which triggers a site rebuild/deploy automatically.

## 4) Local preview (optional)
If you have Ruby installed:
```bash
bundle install
bundle exec jekyll serve
```
Then open http://localhost:4000

## Customize design
Edit `assets/css/app.scss` for colors/typography and UI tweaks.

Enjoy!
