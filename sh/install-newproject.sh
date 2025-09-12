#!/bin/bash
# Run:
# bash install-newproject.sh
# Reload your shell:
# source ~/.bashrc
# Then use:
# . newproject <project-name>

set -euo pipefail

# Location of the script we are installing
TARGET=~/newproject

# Create the script
cat > "$TARGET" <<'SCRIPT_EOF'
#!/bin/bash
set -euo pipefail

BASE_DIR=~/class/projects/lv2

if [ -z "${1:-}" ]; then
  echo "Usage: newproject <project-name>"
  exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH="$BASE_DIR/$PROJECT_NAME"

mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH"

# root files/dirs
touch index.html README.md .gitignore
mkdir -p css images js .github/workflows

# css
curl -fsSL -o css/modal-html-style.css 		https://clayaucoin.github.io/snippets/css/modal-html-style.css
touch css/style.css

# images
curl -fsSL -o images/favicon.ico 			https://clayaucoin.github.io/snippets/images/favicon.ico

# js
curl -fsSL -o js/helpers-full.js      		https://clayaucoin.github.io/snippets/js/helpers-full.js
curl -fsSL -o js/helpers-old.js       		https://clayaucoin.github.io/snippets/js/helpers-old.js
curl -fsSL -o js/modal-html.js        		https://clayaucoin.github.io/snippets/js/modal-html.js
curl -fsSL -o js/my-helpers.js        		https://clayaucoin.github.io/snippets/js/my-helpers.js
curl -fsSL -o js/variables.js         		https://clayaucoin.github.io/snippets/js/variables.js
touch js/script.js js/secret-variables.js js/app.js

# GitHub Actions
curl -fsSL -o .github/workflows/pages.yml 	https://clayaucoin.github.io/snippets/yml/pages.yml

# .gitignore
cat > .gitignore <<'GITIGNORE_EOF'
node_modules/
secret-variables.js

# editor / logs
.vscode/

# virtual environment directories
env/
venv/
ENV/
env.bak/
venv.bak/
.venv/

# OS cruft
.DS_Store
Thumbs.db
GITIGNORE_EOF

git init
git add .
git commit -m "init"

echo "Project '$PROJECT_NAME' created and initialized in $PROJECT_PATH"
SCRIPT_EOF

# Make it executable
chmod +x "$TARGET"

# Ensure ~/ is in PATH (idempotent)
if ! echo ":$PATH:" | grep -q ":$HOME:"; then
  printf '\n# add $HOME to PATH for newproject\nexport PATH="$PATH:$HOME"\n' >> ~/.bashrc
  echo "Added \$HOME to PATH in ~/.bashrc"
fi

echo "Installation complete."
echo "Run: source ~/.bashrc"
echo "Then use: newproject <project-name>"
