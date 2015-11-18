#!/bin/sh
echo "Deploying dist/ folder to GitHub Pages..."
git subtree push --prefix dist origin gh-pages
