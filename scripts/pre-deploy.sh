#!/bin/bash
# Pre-deployment validation for stuartbain.com (STBN)
# Validates TypeScript, builds the project, and checks for issues

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log "🚀 stuartbain.com Pre-Deploy Validation Starting..."

# Check if we're in the right directory
if [[ ! -f "astro.config.mjs" ]]; then
    error "Not in stuartbain.com project directory! Run from project root."
    exit 1
fi

# Ensure Node.js 24 is active
log "Setting up Node.js 24 environment..."
source /home/stuart/.nvm/nvm.sh
nvm use 24 >/dev/null 2>&1
NODE_VERSION=$(node --version)
success "Node.js $NODE_VERSION active"

# Install dependencies if needed
if [[ ! -d "node_modules" ]]; then
    log "Installing dependencies..."
    npm install
    success "Dependencies installed"
fi

# TypeScript validation
log "Running TypeScript validation..."
if npx astro check; then
    success "TypeScript validation passed ✓"
else
    error "TypeScript validation failed!"
    exit 1
fi

# Build the project
log "Building Astro project..."
if npm run build; then
    success "Astro build completed ✓"
else
    error "Astro build failed!"
    exit 1
fi

# Check build output
if [[ -d "dist" && -f "dist/index.html" ]]; then
    success "Build artifacts created ✓"
else
    error "Build artifacts missing!"
    exit 1
fi

# Count files in build output
FILE_COUNT=$(find dist -type f | wc -l)
log "Build contains $FILE_COUNT files"

# Check for common files
REQUIRED_FILES=("dist/index.html" "dist/about/index.html" "dist/projects/index.html" "dist/blog/index.html")
for file in "${REQUIRED_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        success "✓ $file exists"
    else
        warning "⚠ $file missing"
    fi
done

# Check for assets
if [[ -d "dist/_astro" ]]; then
    success "✓ Static assets bundled"
else
    warning "⚠ Static assets directory missing"
fi

# Security check - no secrets in build
log "Scanning for potential secrets in build output..."
SECRET_PATTERNS=(
    "sk-[a-zA-Z0-9]{32,}"
    "AIza[0-9A-Za-z-_]{35}"
    "ya29\."
    "[0-9]+-[0-9A-Za-z_-]{32}\.apps\.googleusercontent\.com"
)

SECRETS_FOUND=0
for pattern in "${SECRET_PATTERNS[@]}"; do
    if grep -r -E "$pattern" dist/ >/dev/null 2>&1; then
        error "Potential secret found matching pattern: $pattern"
        SECRETS_FOUND=$((SECRETS_FOUND + 1))
    fi
done

if [[ $SECRETS_FOUND -eq 0 ]]; then
    success "✓ No secrets detected in build output"
else
    error "$SECRETS_FOUND potential secret(s) found in build!"
    exit 1
fi

# Performance check - check bundle sizes
log "Checking bundle sizes..."
CSS_SIZE=$(find dist/_astro -name "*.css" -exec ls -la {} \; 2>/dev/null | awk '{sum+=$5} END {print sum}' || echo 0)
JS_SIZE=$(find dist/_astro -name "*.js" -exec ls -la {} \; 2>/dev/null | awk '{sum+=$5} END {print sum}' || echo 0)

if [[ $CSS_SIZE -gt 0 ]]; then
    CSS_SIZE_KB=$((CSS_SIZE / 1024))
    log "CSS bundle size: ${CSS_SIZE_KB}KB"
    if [[ $CSS_SIZE_KB -gt 500 ]]; then
        warning "Large CSS bundle (${CSS_SIZE_KB}KB) - consider optimization"
    fi
fi

if [[ $JS_SIZE -gt 0 ]]; then
    JS_SIZE_KB=$((JS_SIZE / 1024))
    log "JS bundle size: ${JS_SIZE_KB}KB"
    if [[ $JS_SIZE_KB -gt 1000 ]]; then
        warning "Large JS bundle (${JS_SIZE_KB}KB) - consider code splitting"
    fi
fi

success "🎉 Pre-deployment validation completed successfully!"
log "Ready for local deployment - run ./scripts/deploy-local.sh"