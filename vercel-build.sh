#!/bin/bash

# Exit on error
set -e

echo "--- Setting environment to production"
export NODE_ENV=production

echo "--- Installing dependencies"
npm install --legacy-peer-deps

# Generate Prisma client
echo "--- Generating Prisma client"
npx prisma generate

# Build the application
echo "--- Building application"
npm run build

# Create a simple _redirects file for SPA routing
echo "/* /index.html 200" > dist/_redirects

echo "--- Build completed successfully"
