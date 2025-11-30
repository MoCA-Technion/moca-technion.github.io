#!/bin/bash
# Script to build and run Jekyll in Docker/OrbStack

set -e

# Add OrbStack Docker to PATH if not already there
if [ -d "$HOME/.orbstack/bin" ]; then
    export PATH="$HOME/.orbstack/bin:$PATH"
fi

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please:"
    echo "1. Make sure OrbStack is running"
    echo "2. Add to your ~/.zshrc: export PATH=\"\$HOME/.orbstack/bin:\$PATH\""
    echo "3. Run: source ~/.zshrc"
    exit 1
fi

echo "🚀 Building Docker image..."
docker compose build

echo "📦 Starting Jekyll server..."
echo "🌐 Server will be available at: http://localhost:4000"
echo "Press Ctrl+C to stop the server"
echo ""

docker compose up

