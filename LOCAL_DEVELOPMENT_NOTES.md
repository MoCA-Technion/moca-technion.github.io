# Local Development Notes

## About the `_site` Folder

The `_site` folder contains the **locally built** version of your website. This is generated when you run:
- `jekyll serve` (development server)
- `jekyll build` (production build)

## Important: URLs in `_site` vs Production

### Local Development (`_site` folder)
When running locally with `jekyll serve --host 0.0.0.0`, the generated HTML will contain:
- URLs like: `http://0.0.0.0:4000/` or `http://localhost:4000/`
- This is **normal and expected** for local development
- The `_site` folder is **not deployed** to GitHub Pages

### Production (GitHub Pages)
When GitHub Pages builds your site, it uses:
- The `url` and `baseurl` from `_config.yml`
- Correct URLs like: `https://moca-technion.github.io/`
- The production build happens on GitHub's servers, not locally

## Configuration

Your `_config.yml` is correctly set:
```yaml
url: "https://moca-technion.github.io"
baseurl: ""
```

This ensures production builds use the correct URL.

## Photo Filename

All source files correctly reference:
- `rui-yao.jpg` (correct spelling)

If you see `rui-yap.jpg` anywhere, it's likely:
1. A typo in a specific file (check the source files)
2. An old cached build (delete `_site` and rebuild)
3. A browser cache issue (clear browser cache)

## Best Practices

1. **Don't commit `_site` folder** - It's in `.gitignore` and shouldn't be committed
2. **Rebuild for production** - Always test with `JEKYLL_ENV=production bundle exec jekyll build`
3. **Check production** - Verify the live site at https://moca-technion.github.io has correct URLs

## Verifying Production URLs

To check if production URLs are correct:
1. Visit: https://moca-technion.github.io
2. View page source
3. Check meta tags - they should show `https://moca-technion.github.io`, not `0.0.0.0`

## Rebuilding Locally

If you want to test with production URLs locally:
```bash
JEKYLL_ENV=production bundle exec jekyll build
```

This will use the production URL from `_config.yml`.

