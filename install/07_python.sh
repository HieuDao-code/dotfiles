# Install basic python tooling
echo "$os: Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "$os: Install python tooling..."

echo "$os: Install commitizen..."
uv tool install commitizen
echo "$os: Install ipython..."
uv tool install ipython --with ipykernel
echo "$os: Install jupyter lab..."
uv tool install jupyterlab
echo "$os: Install mkdocs-material..."
uv tool install mkdocs --with mkdocs-material
echo "$os: Install pre-commit..."
uv tool install pre-commit
echo "$os: Install ruff..."
uv tool install ruff
echo "$os: Install tox..."
uv tool install tox --with tox-uv
