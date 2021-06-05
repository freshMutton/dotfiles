export ZSH="~/.oh-my-zsh"

export EDITOR='vim'

ZSH_TMUX_AUTOSTART=true
ZSH_THEME="prompt"

plugins=(
  git-prompt
  tmux
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# aliases
alias ls="ls -laG"
alias clr="clear"

alias stat="git status --short --branch"
alias push="git rev-parse --abbrev-ref HEAD | xargs git push origin "
alias chk="git checkout"
alias add="git add -p"
alias addall="git add ."
alias stash="git stash"
alias pop="git stash pop"
alias pull="git pull"
alias fetch="git fetch"
alias commit="git commit -m"
alias branch="git branch"
alias nuke="git reset --hard"
alias log="git log \
  --graph \
  --abbrev-commit \
  --decorate \
  --all \
  --format=format:\"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)\""
alias merge="git merge --no-ff"
alias amend="git commit --amend"
alias fixup="git commit --fixup"
alias shove="git push --force"
alias rebase="git rebase -i --autosquash"

alias v="vim"

[ -f ~/.opam/opam-init/init.zsh ] && source ~/.opam/opam-init/init.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -f $(brew --prefix nvm)/nvm.sh ] && source $(brew --prefix nvm)/nvm.sh
[ -f $(brew --prefix nvm)/etc/bash_completion.d/nvm ] && \
source $(brew --prefix nvm)/etc/bash_completion.d/nvm
