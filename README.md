# MoCA Lab Website (Jekyll + Bulma Clean Theme)

This repo is a low-maintenance academic/lab site:
- Markdown pages (+ LaTeX via MathJax)
- GitHub Pages deployment via GitHub Actions
- Automatic publication sync from Google Scholar using SerpApi

## Deploy
1. Create a GitHub repository and push these files to `main`.
2. Repo → **Settings → Pages** → **Source: GitHub Actions**
3. Push changes to trigger deployment.

### baseurl / url
- If your site is `https://<username>.github.io/<repo>`, set in `_config.yml`:
  - `url: "https://<username>.github.io"`
  - `baseurl: "/<repo>"`
- If your site is `https://<username>.github.io`, keep `baseurl: ""`.

## Publications (SerpApi)
1. Add repo secret `SERPAPI_API_KEY`.
2. Run workflow **Update publications (Google Scholar via SerpApi) + Deploy** once.

This workflow:
- runs the fetch script
- commits only if `_data/publications*.json` changed
- deploys only when changed

## Local preview
```bash
bundle install
bundle exec jekyll serve
```
