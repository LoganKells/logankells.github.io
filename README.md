# 1. Overview

This repo contains the source code for my webpage: https://www.logankells.com.

The project is built using Jupyter Book and deployed to Github Pages.

# Getting Started

## 1. Install

Install project dependencies using Python 3.14 and Poetry. The supported interpreter
is installed by Homebrew at `/opt/homebrew/opt/python@3.14/bin/python3`.

- `poetry env use /opt/homebrew/opt/python@3.14/bin/python3`
- `poetry lock`
- `poetry install`

## 2. Build

Run the following commands from the root of the `origin/main` branch.

- `poetry run jupyter-book build docs/`

## 3. Deploy

After building the project, deploy to the `gh-pages` branch. This branch should be configured in the 
Github Pages settings.

- `ghp-import -n -p -f docs/_build/html`

# References

- HTML generation by JupyterBook: https://jupyterbook.org/en/stable/content/index.html
- Theming by Sphinx: https://pydata-sphinx-theme.readthedocs.io/en/stable/index.html
