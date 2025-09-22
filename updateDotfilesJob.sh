#!/bin/bash

# Goto REPO_PATH (exit if does not exist) and perform git pull
REPO_PATH="$HOME/Documents/Dotfiles_MVincent"
cd "$REPO_PATH" || exit
git pull

# Copy over local files to repo
cp "$HOME/.bash_profile" "$REPO_PATH/.bash_profile"
cp -r "$HOME/.config/nvim" "$REPO_PATH/.config"

# Check for diff in copied local files
if ! git diff --quiet || ! git diff --cached --quiet; then
  # Add, commit and push changes
  git add .
  git commit -m "Auto update: $(date '+%Y-%m-%d %H:%M')"
  git push
fi
