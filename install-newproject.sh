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
  && touch index.html style.css \
  && curl -o helpers.js https://clayaucoin.github.io/snippets/helpers.js \
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
