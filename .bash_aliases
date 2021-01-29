export EDITOR=vim
export VISUAL=vim
export PATH="~/node_modules/@angular/cli/bin:$PATH"

_xfunc git __git_complete gp _git_push
_xfunc git __git_complete gl _git_pull

alias gp='git push'
alias gpt='git push --tags'
alias gl='git pull'
alias vim='vim -p'
alias update='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove'
alias clean='rm -f *.xz *.deb *.dsc *.changes *.build *.gz'
alias dc='docker-compose'
alias dgc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc'
alias dcu='dc pull && dc up -d'
alias tmuxa='tmux new-session -A -s Admin -n bartender'
alias motd='cat /run/motd.dynamic'

