#!/bin/bash

REPO="$1"

# Check repo path was given
if [ -z "$REPO" ]; then
  echo "Error: No repository path provided." >&2
  echo "Usage: $0 /path/to/dotfiles" >&2
  exit 1
fi

# Check repo path exists
if [ ! -e "$REPO" ]; then
  echo "Error: Path '$REPO' does not exist." >&2
  exit 2
fi

# Add future links here (fmt: "repo_path,local_path")
allowed_list=(
	"$REPO/waybar,$HOME/.config/waybar"
	"$REPO/wofi,$HOME/.config/wofi"
	"$REPO/wlogout,$HOME/.config/wlogout"
	"$REPO/hypr,$HOME/.config/hypr"
	"$REPO/kitty,$HOME/.config/kitty"
	"$REPO/zsh/.zshrc,$HOME/.zshrc"
	"$REPO/zsh/.p10k.zsh,$HOME/.p10k.zsh"
	"$REPO/bash/.bashrc,$HOME/.bashrc"
	"$REPO/gtk-3.0,$HOME/.config/gtk-3.0"
	"$REPO/dolphin/dolphinrc,$HOME/.config/dolphinrc"
	"$REPO/mako,$HOME/.config/mako"
	)

# Delete local path if it already exists and create a
# symbolic link between the repo path and local path
for tuple in "${allowed_list[e]}"; do
    IFS=',' read -r repo_path local_path <<< "$tuple"
    if [ -e "$local_path" ]; then
	echo "Removing: $local_path"
	rm -rf "$local_path"
    fi
    echo "Linking: $repo_path → $local_path"
    ln -s "$repo_path" "$local_path"
done	

