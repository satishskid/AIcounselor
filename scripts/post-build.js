#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

console.log('Running post-build script...');

// Ensure the dist directory exists
const distDir = path.join(process.cwd(), 'dist');
if (!fs.existsSync(distDir)) {
  console.error('Error: dist directory does not exist');
  process.exit(1);
}

// Create _redirects file for SPA routing
const redirectsPath = path.join(distDir, '_redirects');
fs.writeFileSync(redirectsPath, '/* /index.html 200');
console.log('Created SPA redirects file');

// Verify required files exist
const requiredFiles = ['index.html', 'assets'];
let missingFiles = [];

requiredFiles.forEach(file => {
  const filePath = path.join(distDir, file);
  if (!fs.existsSync(filePath)) {
    missingFiles.push(file);
  }
});

if (missingFiles.length > 0) {
  console.error(`Error: Missing required build files: ${missingFiles.join(', ')}`);
  process.exit(1);
}

console.log('Post-build script completed successfully');
