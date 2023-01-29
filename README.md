# 1. Overview
This repo contains the source code for my webpage: https://logankells.github.io

# 1. Install

`pip install -r requirements.txt`

# 2. Build
Run the following commands from the root of the `origin/main` branch.
- `jupyter-book build docs/`

# 4. Deploy
After building the project, deploy to the `gh-pages` branch. This branch should be configured in the 
Github Pages settings.
- `ghp-import -n -p -f docs/_build-html`
