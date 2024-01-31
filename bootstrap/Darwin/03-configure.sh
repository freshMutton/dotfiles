echo "Bootstrapping tmux..."
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-battery ~/.tmux/plugins/battery

echo "done"

echo "Bootstrapping oh-my-zsh..."

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "done"

echo "Bootstrapping fzf..."

eval "$(brew --prefix fzf)/install --all --no-zsh"

echo "done"
