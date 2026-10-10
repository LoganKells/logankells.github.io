# 1. Overview

This repo contains the source code for my webpage: https://www.logankells.com.

The project is built using Jupyter Book and deployed to Github Pages.

# Getting Started

## 1. Install

Install project dependencies using Python 3.14 and Poetry. The supported interpreter
is installed by Homebrew at `/opt/homebrew/opt/python@3.14/bin/python3`.

```powershell
poetry env use /opt/homebrew/opt/python@3.14/bin/python3
poetry lock
poetry install
poetry check
```

## 2. Run locally

This will run the project using jupyter-book server.

```powershell
make run
```

## 3. Build and run static site locally

```powershell
make run-build
```

## 4. Deploy

Run the following commands from the root of the `origin/main` branch.

After building the project it will deploy to the `gh-pages` branch. This branch should be configured in the Github Pages settings.

```powershell
make deploy
```

# References

- HTML generation by JupyterBook: https://jupyterbook.org/en/stable/content/index.html
- Theming by Sphinx: https://pydata-sphinx-theme.readthedocs.io/en/stable/index.html
