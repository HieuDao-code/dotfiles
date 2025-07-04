# Python tooling

This is a list of python tools which get installed. We use [uv](https://github.com/astral-sh/uv) to manage our python tools in an isolated and persistent environment.

Install uv via the standalone installer:

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Install python tools via uv:

```sh
# commitizen
uv tool install commitizen

# mkdocs material
uv tool install mkdocs --with mkdocs-material

# pre-commit
uv tool install pre-commit

# ruff
uv tool install ruff

# tox
uv tool install tox --with tox-uv

# ty
uv tool install ty@latest
```

## Tools

| Name                                                            | Description                                                                |
| --------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [commitizen](https://github.com/commitizen-tools/commitizen)    | Commitizen is release management tool designed for teams                   |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | A powerful documentation framework on top of MkDocs                        |
| [pre-commit](https://github.com/pre-commit/pre-commit)          | A framework for managing and maintaining multi-language pre-commit hooks   |
| [ruff](https://github.com/astral-sh/ruff)                       | An extremely fast Python linter and code formatter                         |
| [uv](https://github.com/astral-sh/uv)                           | An extremely fast Python package and project manager                       |
| [tox](https://github.com/tox-dev/tox)                           | tox is a generic virtual environment management and test command line tool |
| [ty](https://github.com/astral-sh/ty)                           | An extremely fast Python type checker and language server                  |
