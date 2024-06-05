export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/oh-my-zsh-custom

export EDITOR='nvim'

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
alias chk="git checkout \$(git branch | fzf)"
alias add="git add -p"
alias addall="git add ."
alias stash="git stash -u"
alias pop="git stash pop"
alias pull="git pull"
alias fetch="git fetch"
alias commit="git commit -m"
alias branch="git checkout -b"
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
alias yolo="git push --force --no-verify"
alias yeet="git push --no-verify"

alias v="nvim"
alias tree="tree --gitignore -L"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \
  \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

eval $(thefuck --alias)
