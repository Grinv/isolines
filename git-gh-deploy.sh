#!/bin/sh
echo "Deploying build/ folder to GitHub Pages..."
git subtree push --prefix build origin gh-pages
