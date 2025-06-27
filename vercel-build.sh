#!/bin/bash

# Exit on error
set -e

# Set environment variables
export NODE_ENV=production

# Print environment info
echo "--- Node.js version: $(node -v)"
echo "--- npm version: $(npm -v)"

# Install dependencies
echo "--- Installing dependencies"
npm install --legacy-peer-deps

# Generate Prisma client
echo "--- Generating Prisma client"
npx prisma generate

# Build the application
echo "--- Building application"
npm run build

# Run post-build steps
echo "--- Running post-build steps"
node scripts/post-build.js

echo "--- Build completed successfully"
