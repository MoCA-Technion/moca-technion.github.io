# Running Jekyll with Docker/OrbStack

This setup matches the GitHub Actions environment exactly (Ubuntu + Ruby 3.2).

## Prerequisites

- OrbStack (or Docker Desktop) installed
- Git

## Quick Start

### Option 1: Using the script (easiest)

```bash
./docker-run.sh
```

### Option 2: Using docker compose directly

```bash
# Build the image
docker compose build

# Start the server
docker compose up

# Or run in detached mode
docker compose up -d

# View logs
docker compose logs -f

# Stop the server
docker compose down
```

### Option 3: Using Docker directly

```bash
# Build the image
docker build -t moca-jekyll .

# Run the container
docker run -it --rm \
  -p 4000:4000 \
  -v $(pwd):/app \
  moca-jekyll
```

## Access the Website

Once the server is running, open:
- **Local**: http://localhost:4000
- **Network**: http://0.0.0.0:4000

## Environment Details

- **OS**: Ubuntu 22.04 (matches GitHub Actions `ubuntu-latest`)
- **Ruby**: 3.2.9 (matches GitHub Actions `ruby-version: "3.2"`)
- **Bundler**: 2.3.26 (from `Gemfile.lock`)
- **Jekyll**: Latest 4.3.x (from `Gemfile`)

## Useful Commands

```bash
# Rebuild after changing Gemfile
docker compose build --no-cache

# Run Jekyll commands inside container
docker compose exec jekyll bash
# Then inside: bundle exec jekyll build

# View container logs
docker compose logs -f jekyll

# Stop and remove containers
docker compose down

# Clean up everything (including volumes)
docker compose down -v
```

## Troubleshooting

### Port already in use
If port 4000 is already in use, change it in `docker-compose.yml`:
```yaml
ports:
  - "4001:4000"  # Use 4001 instead
```

### Changes not reflecting
The container uses volume mounting, so changes should reflect automatically. If not:
- Restart the container: `docker compose restart`
- Or rebuild: `docker compose up --build`

### Permission issues
If you encounter permission issues with mounted volumes, you may need to adjust file permissions or use a different volume mounting strategy.

