echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing environment..."
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts --require-sha"
brew tap caskroom/cask
brew tap Homebrew/bundle
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew bundle

echo "Configuring..."

echo "* ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "* Neovim"
pip2 install neovim --upgrade
pip3 install neovim --upgrade
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "* Node"
nvm install stable
npm install npm@latest -g
npm install -g yarn flow-bin tern eslint prettier

echo "* OCaml"
opam install merlin ocp-indent jbuilder

echo "Done!"
