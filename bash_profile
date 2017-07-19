if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
source /usr/local/etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="true"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="true"

PROMPT_COMMAND='__git_ps1 "\n\w" "\n\$ "'
__git_complete chk _git_checkout
__git_complete push _git_push
__git_complete pull _git_pull
__git_complete fetch _git_fetch
__git_complete merge _git_merge

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

alias v="vim"

alias vm="prlctl"

alias dv="vm start \"dev\""
alias kill-dv="vm stop \"dev\""
alias tv="vm start \"test\""
alias kill-tv="vm stop \"test\""
alias vv="vm start \"vpn\""
alias kill-vv="vm stop \"vpn\""

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# NVM configuration
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
