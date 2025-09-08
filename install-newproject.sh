#!/bin/bash

# Location of the script we are installing
TARGET=~/newproject

# Create the script
cat > "$TARGET" <<'EOF'
#!/bin/bash

BASE_DIR=~/class/projects/lv2

if [ -z "$1" ]; then
  echo "Usage: . newproject <project-name>"
  exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH="$BASE_DIR/$PROJECT_NAME"

mkdir -p "$PROJECT_PATH" \
  && cd "$PROJECT_PATH" \
  && touch index.html README.md .gitignore \
  && mkdir css \
  && cd css \
  && touch style.css \
  && cd .. \
  && mkdir images \
  && mkdir js \
  && cd js \
  && curl -o helpers-full.js https://clayaucoin.github.io/snippets/helpers-full.js \
  && curl -o helpers-old.js https://clayaucoin.github.io/snippets/helpers-old.js \
  && touch script.js secret-variables.js app.js \
  && cd .. \
  && mkdir .github \
  && cd .github \
  && mkdir workflows \
  && cd workflows \
  && curl -o pages.yml https://clayaucoin.github.io/snippets/pages.yml \
  && cd ../.. \
  && cat <<EOF > .gitignore
node_modules/
secret-variables.js
.DS_Store
Thumbs.db
EOF
  && git init \
  && git add . \
  && git commit -m "init"

echo "Project '$PROJECT_NAME' created and initialized in $PROJECT_PATH"
EOF

# Make it executable
chmod +x "$TARGET"

# Ensure ~/ is in PATH
if ! echo $PATH | grep -q "$HOME"; then
  echo 'export PATH=$PATH:$HOME' >> ~/.bashrc
  echo "Added \$HOME to PATH in ~/.bashrc"
fi

echo "Installation complete."
echo "Run: source ~/.bashrc"
echo "Then use: . newproject <project-name>"
