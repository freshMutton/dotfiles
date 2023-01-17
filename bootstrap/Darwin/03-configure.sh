export GLOBAL_PYTHON_VERSION = 3.10

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

echo "Bootstrapping fzf..."

eval "$(brew --prefix fzf)/install --all --no-zsh"

echo "done"

echo "Bootstrapping pyenv..."

pyenv install $GLOBAL_PYTHON_VERSION
pyenv global $GLOBAL_PYTHON_VERSION

echo "done"

echo "Bootstrapping rustup..."

rustup-init -y

echo "done"

echo "Boostrapping opam..."

opam init --no
eval $(opam env --switch=default)

echo "done"

echo "Bootstrapping nvm..."

mkdir ~/.nvm
nvm install node

echo "done"
