export EDITOR=vim
export VISUAL=vim
export PATH="~/node_modules/@angular/cli/bin:$PATH"

_xfunc git __git_complete gp _git_push
_xfunc git __git_complete gl _git_pull

function update_system() {
    sudo apt update
    sudo apt dist-upgrade -y
    sudo apt autoremove -y

    if command -v needrestart $>/dev/null; then
        sudo needrestart
    fi
}

function tv() {
    if [[ ! -d "../../../../videos/TV/${1}" ]]; then
        echo "${1} directory not found in TV section"
    fi

    rsync -avP *.mkv "../../../../videos/TV/${1}"
}

alias gp='git push'
alias gpt='git push --tags'
alias gl='git pull'
alias gb='git branch'
alias vim='vim -p'
alias update='update_system'
alias clean='rm -f *.xz *.deb *.dsc *.changes *.build *.gz'
alias dc='docker-compose'
alias dgc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc'
alias dcu='dc pull && dc up -d'
alias tmuxa='tmux new-session -A -s Admin -n bartender'
alias motd='cat /run/motd.dynamic'
alias yp='yadm push'
alias yl='yadm pull'
alias ym='yadm'
alias movie='rsync -avP *.mkv ../../../../videos/Movies/.'
