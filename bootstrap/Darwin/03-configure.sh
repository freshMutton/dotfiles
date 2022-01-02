echo "Bootstrapping vim..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.vim/colors/molokai.vim --create-dirs \
  https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

echo "done"

echo "Bootstrapping tmux..."

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tmux-battery ~/.tmux/plugins/battery

echo "done"

echo "Bootstrapping oh-my-zsh..."

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "done"

echo "Bootstrapping Rust..."

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "done"

echo "Bootstrapping NVM..."

mkdir ~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install stable

echo "done"
