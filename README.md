# MoCA Lab Website

The official website for the **Mobility Computation & Analytics (MoCA) Lab** at the Technion - Israel Institute of Technology.

Built with [Jekyll](https://jekyllrb.com/) and the [Bulma Clean Theme](https://github.com/chrisrhymes/bulma-clean-theme), featuring a Google Research-inspired design with a clean, borderless aesthetic.

## Features

- **Modern, Responsive Design**: Google Research-inspired aesthetic with Technion Navy, Gold, and Google Gray color scheme
- **Content Management**: 
  - Jekyll collections for people and news
  - HTML forms to generate markdown files for team members and news items
  - Automatic page generation from markdown files
- **Publications**: Automatic sync from Google Scholar via SerpApi
- **SEO Optimized**: Comprehensive meta tags, Open Graph, Twitter Cards, structured data (JSON-LD)
- **Performance**: Font preloading, lazy loading images, DNS prefetch
- **Mobile Responsive**: Optimized layouts for desktop, tablet, and mobile devices

## Site Structure

### Pages
- **Home** (`index.md`): Hero section, research areas, latest news
- **Research** (`research.md`): Lab research directions and methodology
- **People** (`people.md`): Principal Investigator and research team
- **Publications** (`publications.md`): Research publications with year navigation
- **News** (`news.md`): Lab news and updates
- **Join** (`join.md`): Open positions and application process
- **Contact** (`contact.md`): Contact information

### Collections

#### People Collection (`_people/`)
- Individual team member pages
- Auto-generated from markdown files
- Permalink: `/people/:name/`
- Use the [Add Person form](https://moca-technion.github.io/people/add-person/) to generate new member pages

#### News Collection (`_news/`)
- News items with optional full pages
- Supports full dates (YYYY-MM-DD) and month-only dates (YYYY-MM)
- Permalink: `/news/:name/`
- Use the [Add News form](https://moca-technion.github.io/news/add-news/) to generate new news items

### Data Files (`_data/`)
- `site.json`: Site-wide configuration (PI info, contact details)
- `navigation.yml`: Main navigation menu
- `footer_menu.yml`: Footer links
- `publications.json`: Publications data (auto-generated from Google Scholar)
- `publications_meta.json`: Publication metadata

## Local Development

### Prerequisites
- Ruby 2.6+ (or use rbenv/rvm)
- Bundler

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/moca-technion/moca-technion.github.io.git
   cd moca-technion.github.io
   ```

2. **Install dependencies**
   ```bash
   bundle install --path vendor/bundle
   ```

3. **Run the local server**
   ```bash
   bundle exec jekyll serve
   ```

4. **View the site**
   Open [http://localhost:4000](http://localhost:4000) in your browser

### Building for Production

```bash
bundle exec jekyll build
```

The built site will be in the `_site/` directory.

## Deployment

This site is deployed to GitHub Pages using GitHub Actions.

### Setup

1. **Create a GitHub repository** and push these files to the `main` branch
2. **Configure GitHub Pages**:
   - Go to **Repository → Settings → Pages**
   - Set **Source: GitHub Actions**
3. **Push changes** to trigger automatic deployment

### baseurl / url Configuration

- If your site is `https://<username>.github.io/<repo>`:
  - Set in `_config.yml`:
    - `url: "https://<username>.github.io"`
    - `baseurl: "/<repo>"`
- If your site is `https://<username>.github.io`:
  - Keep `baseurl: ""` in `_config.yml`

## Publications Management

### Automatic Sync from Google Scholar

The site automatically syncs publications from Google Scholar using SerpApi.

1. **Add SerpApi API Key**:
   - Go to **Repository → Settings → Secrets and variables → Actions**
   - Add a new secret: `SERPAPI_API_KEY` with your SerpApi key

2. **Run the workflow**:
   - Go to **Actions** tab
   - Run the **Update publications (Google Scholar via SerpApi) + Deploy** workflow

The workflow:
- Fetches publications from Google Scholar
- Updates `_data/publications.json` and `_data/publications_meta.json`
- Commits changes only if publications changed
- Triggers deployment

### Manual Publication Updates

Publications are stored in:
- `_data/publications.json`: Full publication data
- `_data/publications_meta.json`: Metadata for filtering and display

## Content Management

### Adding Team Members

1. Visit `/people/add-person/` on the live site
2. Fill out the form with member information
3. Copy or download the generated markdown file
4. Save it to `_people/<name-slug>.md`
5. Commit and push to GitHub

The site will automatically generate:
- Individual person page at `/people/:name/`
- Card on the people page

### Adding News Items

1. Visit `/news/add-news/` on the live site
2. Fill out the form with news information
3. Optionally add markdown content for a full news page
4. Copy or download the generated markdown file
5. Save it to `_news/<slug>.md`
6. Commit and push to GitHub

The site will automatically:
- Display news on the home page (latest 5)
- List all news on the news page
- Generate individual news pages if content is provided
- Support month-only dates (e.g., "January 2025")

## Customization

### Colors

The site uses a custom color scheme defined in `assets/css/app.scss`:
- **Technion Navy**: `#002147`
- **Gold**: `#D4AF37`
- **Google Gray**: `#5F6368`

### Styling

Custom styles are in `assets/css/app.scss`. Key sections:
- Global layout and typography
- Hero section styling
- Card systems (research areas, people, news)
- Publication list styling
- Responsive breakpoints

### SEO

SEO meta tags are managed in `_includes/seo.html`:
- Primary meta tags (title, description, keywords)
- Open Graph tags
- Twitter Card tags
- Structured data (JSON-LD) for Organization, Person, and NewsArticle

## Project Structure

```
.
├── _config.yml              # Jekyll configuration
├── _data/                   # Data files (YAML/JSON)
├── _includes/               # Reusable HTML includes
├── _layouts/                # Page layouts
├── _people/                 # People collection (markdown files)
├── _news/                   # News collection (markdown files)
├── _plugins/                # Jekyll plugins
├── assets/                  # CSS, images, JS
├── people/                  # People management forms
├── news/                    # News management forms
├── index.md                 # Home page
├── research.md              # Research page
├── people.md                # People page
├── publications.md          # Publications page
├── news.md                  # News page
├── join.md                  # Open positions page
├── contact.md               # Contact page
└── Gemfile                  # Ruby dependencies
```

## Dependencies

- **Jekyll** (~> 4.3): Static site generator
- **bulma-clean-theme** (~> 1.0): Base theme
- **jekyll-sitemap**: Automatic sitemap generation
- **jekyll-feed**: RSS feed generation
- **webrick**: HTTP server for local development

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Responsive design for all screen sizes

## Credits

- **Theme**: [Bulma Clean Theme](https://github.com/chrisrhymes/bulma-clean-theme) by Chris Rhymes
- **Built with**: [Cursor](https://cursor.sh/) AI code editor

## License

This website is the property of the MoCA Lab at the Technion. All rights reserved.

## Support

For questions or issues with the website, please contact the lab at the email address listed on the [Contact page](https://moca-technion.github.io/contact/).
