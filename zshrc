export ZSH=/Users/msutton/.oh-my-zsh
export EDITOR='nvim'
ZSH_TMUX_AUTOSTART=true
ZSH_THEME="prompt"

plugins=(git-prompt tmux vi-mode)
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases
alias ls="ls -laG"
alias fuck='sudo $(history -p !!)'
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
alias log="git log --graph --abbrev-commit --decorate --all --format=format:\"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)\""
alias merge="git merge --no-ff"

alias v="nvim"

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# NVM configuration
. ~/.nvm/nvm.sh > /dev/null 2> /dev/null || true

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
