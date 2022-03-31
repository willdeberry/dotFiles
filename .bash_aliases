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
alias gbr='git for-each-ref --format "%(refname:short)" refs/heads | grep -vw "master\|main\|prod" | xargs git branch -D'
alias vim='vim -p'
alias update='update_system'
alias clean='rm -f *.xz *.deb *.dsc *.changes *.build *.gz'
alias dc='docker-compose'
alias dcu='dc pull && dc up -d'
alias dbx='docker buildx build --platform linux/arm64,linux/amd64'
alias tmuxa='tmux new-session -A -s Admin -n bartender'
alias motd='cat /run/motd.dynamic'
alias yp='yadm push'
alias yl='yadm pull'
alias ym='yadm'
alias movie='rsync -avP *.mkv ../../../../videos/Movies/.'
alias kid='rsync -avP *.mkv ../../../../videos/Kids/.'
