#!/bin/bash
# Setup script for OrbStack Docker environment

echo "🔍 Checking OrbStack installation..."

# Check if OrbStack is installed
if [ -d "/Applications/OrbStack.app" ]; then
    echo "✅ OrbStack is installed"
    
    # Add OrbStack bin to PATH if not already there
    ORBSTACK_BIN="$HOME/.orbstack/bin"
    if [ -d "$ORBSTACK_BIN" ]; then
        if [[ ":$PATH:" != *":$ORBSTACK_BIN:"* ]]; then
            echo "📝 Adding OrbStack to PATH..."
            echo "" >> ~/.zshrc
            echo "# OrbStack Docker" >> ~/.zshrc
            echo "export PATH=\"\$HOME/.orbstack/bin:\$PATH\"" >> ~/.zshrc
            export PATH="$HOME/.orbstack/bin:$PATH"
            echo "✅ Added to PATH. Please run: source ~/.zshrc"
        else
            echo "✅ OrbStack already in PATH"
        fi
    fi
else
    echo "❌ OrbStack not found in /Applications/"
    echo ""
    echo "Please install OrbStack:"
    echo "1. Download from: https://orbstack.dev"
    echo "2. Install the .dmg file"
    echo "3. Launch OrbStack from Applications"
    echo "4. Run this script again"
    exit 1
fi

# Check if Docker is accessible
if command -v docker &> /dev/null; then
    echo "✅ Docker is accessible"
    docker --version
    docker compose version
else
    echo "❌ Docker command not found"
    echo ""
    echo "Please:"
    echo "1. Make sure OrbStack is running (check the menu bar)"
    echo "2. Run: source ~/.zshrc"
    echo "3. Or restart your terminal"
    exit 1
fi

echo ""
echo "✅ Setup complete! You can now run: ./docker-run.sh"


