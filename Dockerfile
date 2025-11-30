# Dockerfile for MoCA Lab Website
# Matches GitHub Actions environment (Ubuntu + Ruby 3.2)

FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV RUBY_VERSION=3.2
ENV BUNDLER_VERSION=2.3.26

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libyaml-dev \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libgdbm-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Ruby using rbenv (matching GitHub Actions ruby/setup-ruby@v1)
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    ~/.rbenv/plugins/ruby-build/install.sh

ENV PATH="/root/.rbenv/bin:$PATH"
RUN eval "$(rbenv init -)" && \
    rbenv install 3.2.9 && \
    rbenv global 3.2.9 && \
    gem install bundler:${BUNDLER_VERSION}

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock (if exists)
COPY Gemfile* ./

# Install gems (will generate Gemfile.lock if it doesn't exist)
RUN eval "$(rbenv init -)" && \
    bundle install

# Copy the rest of the application
COPY . .

# Expose Jekyll port
EXPOSE 4000

# Create entrypoint script
RUN echo '#!/bin/bash\n\
set -e\n\
eval "$(rbenv init -)"\n\
cd /app\n\
bundle install\n\
exec "$@"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Default command: serve Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]

