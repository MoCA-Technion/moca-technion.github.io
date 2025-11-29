# SEO and Performance Improvements

This document outlines the SEO and performance optimizations implemented for the MoCA Lab website.

## SEO Improvements

### 1. Comprehensive Meta Tags (`_includes/seo.html`)
- **Primary Meta Tags**: Title, description, keywords, author
- **Open Graph Tags**: For better social media sharing (Facebook, LinkedIn)
- **Twitter Card Tags**: Optimized Twitter sharing
- **Canonical URLs**: Prevents duplicate content issues
- **Structured Data (JSON-LD)**: 
  - Organization schema for the lab
  - Person schema for individual team member pages
  - NewsArticle schema for news items

### 2. robots.txt
- Created `robots.txt` file to guide search engine crawlers
- Includes sitemap reference for better indexing

### 3. Image Optimization
- **Lazy Loading**: All images use `loading="lazy"` attribute
- **Async Decoding**: Images use `decoding="async"` for better performance
- **Descriptive Alt Text**: All images have meaningful alt text for accessibility and SEO
- **Width/Height Attributes**: Prevents layout shift during image loading

### 4. Site Configuration
- Updated `_config.yml` with proper URL (`https://moca-technion.github.io`)
- Sitemap plugin already configured (`jekyll-sitemap`)
- Feed plugin configured (`jekyll-feed`)

## Performance Improvements

### 1. Font Loading Optimization
- **DNS Prefetch**: Pre-resolves DNS for Google Fonts
- **Preconnect**: Establishes early connections to font servers
- **Asynchronous Loading**: Fonts load asynchronously to prevent render blocking
- **Display Swap**: Uses `display=swap` to show fallback fonts immediately

### 2. Resource Hints
- DNS prefetch for external resources
- Preconnect for critical third-party domains

### 3. CSS Optimization
- SCSS is already set to `compressed` style in `_config.yml`
- Critical CSS is inlined in `head-scripts.html`

### 4. Image Optimization
- Lazy loading reduces initial page load
- Proper dimensions prevent layout shift
- Async decoding improves perceived performance

## Files Modified/Created

### New Files
- `_includes/seo.html` - Comprehensive SEO meta tags
- `robots.txt` - Search engine crawler instructions
- `_includes/performance.html` - Performance optimization includes (optional)

### Modified Files
- `_includes/head-scripts.html` - Added SEO include and optimized font loading
- `_config.yml` - Added proper URL
- `_layouts/person.html` - Added lazy loading and better alt text to images
- `people.md` - Added lazy loading and better alt text to images

## Testing Recommendations

1. **SEO Testing**:
   - Use Google Search Console to verify structured data
   - Test with [Google Rich Results Test](https://search.google.com/test/rich-results)
   - Verify meta tags with [Open Graph Debugger](https://developers.facebook.com/tools/debug/)
   - Check Twitter Card preview with [Twitter Card Validator](https://cards-dev.twitter.com/validator)

2. **Performance Testing**:
   - Use [Google PageSpeed Insights](https://pagespeed.web.dev/)
   - Test with [WebPageTest](https://www.webpagetest.org/)
   - Check [Lighthouse](https://developers.google.com/web/tools/lighthouse) scores

3. **Accessibility**:
   - Verify alt text is meaningful
   - Test with screen readers
   - Use [WAVE](https://wave.webaim.org/) accessibility checker

## Additional Recommendations

1. **Create Open Graph Image**: Create a default OG image at `/assets/img/og-image.jpg` (1200x630px recommended)

2. **Add Favicon**: Add favicon files in various sizes:
   - `/favicon.ico`
   - `/apple-touch-icon.png` (180x180px)
   - `/favicon-32x32.png`
   - `/favicon-16x16.png`

3. **Consider Service Worker**: For offline support and caching (optional, see `_includes/performance.html`)

4. **Image Optimization**: Consider using WebP format with fallbacks for better compression

5. **Minify JavaScript**: If you add custom JavaScript, consider minifying it

6. **CDN for Assets**: Consider using a CDN for static assets if traffic increases

## Notes

- The SEO include is automatically added to all pages via `head-scripts.html`
- Structured data automatically adapts based on page layout (person, news, or default)
- All improvements are backward compatible and won't break existing functionality

