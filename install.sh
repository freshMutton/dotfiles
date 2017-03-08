echo "Creating symlinks..."

WORKING_DIR="`dirname \"$0\"`"
WORKING_DIR="`( cd "$WORKING_DIR" && pwd )`"

for f in *; do
  if [ "$f" == "install.sh" ]; then continue; fi

  echo " - $f -> $HOME/.$f"
  ln -sf "$WORKING_DIR/$f" "$HOME/.$f"
done

echo "Done!"
