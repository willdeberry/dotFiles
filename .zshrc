# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GEM_HOME=~/.gem
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export PATH=~/.cargo/bin:/opt/homebrew/opt/gnupg@2.2/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/coreutils/libexec/gnubin:~/code/scripts:$GEM_HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="will"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  gitfast
  terraform
  yadm
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

autoload -U compaudit compinit bashcompinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR='vim'
export VISUAL=vim
export AWS_PAGER=""

zstyle ':completion:*' special-dirs true

# disable confirmation of history expansion eg: use of !$
unsetopt HIST_VERIFY

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gp='git push'
alias gpt='git push --tags'
alias gl='git pull'
alias gb='git branch'
alias gbr='git for-each-ref --format "%(refname:short)" refs/heads | grep -vw "master\|main\|prod" | xargs git branch -D'
alias nvim='nvim -p'
alias vim='nvim -p'
alias vi='vim -p'
alias clean='rm -f *.xz *.deb *.dsc *.changes *.build *.gz'
alias web='python3 -m http.server'
alias home='ssh home'
alias aws-admin="aws-vault exec admin -- aws"
alias ls="ls --color=auto"

#IDTec
alias rclone='rclone --client-cert ~/.config/rclone/IDTEC.crt --client-key ~/.config/rclone/IDTEC.key --no-check-certificate=true --multi-thread-streams 8'

function bfmt() {
    local dest

    dest="${1}"

    find "${dest}" -not -path '*/\.*' -type f -exec grep -IRl '#\!\(/usr/bin/env bash\|/bin/bash\)' {} \+ |
        xargs shfmt -i 4 -ci -w
}

function bcheck() {
    local dest

    dest="${1}"

    find "${dest}" -not -path '*/\.*' -type f -exec grep -IRl '#\!\(/usr/bin/env bash\|/bin/bash\)' {} \+ |
        xargs shellcheck -x
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
