export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
export DEFAULT_USERNAME="Leo"

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
DISABLE_AUTO_TITLE="true"

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
plugins=(git vi-mode)

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"adding 0 10px

source $ZSH/oh-my-zsh.sh
export NODE_ENV='development'
set editing-mode vi
set blink-matching-paren on

alias gc='git commit'
alias gca='git commit --amend'
alias gs='git status'
alias gsh='git stash'
alias gch='git checkout'
alias gb='git checkout -b'
alias gl='git log --pretty="%Cblue%h %Cred%ar %Cgreen(%an) %Creset%s"'
alias ga='git add'
alias gad='git add -A'

alias gmt='git mergetool'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias grs='git rebase --skip'

alias vim='nvim'
alias vims='nvim -S session.vim'

alias ns='yarn start -s'
alias y='yarn'
alias yr='yarn run'

DEFAULT_USER=`whoami`

function run() {
  eval ./node_modules/.bin/$@
}

function push() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  echo "Pushing to branch \e[33m$BRANCH\e[0m on \e[34morigin\e[0m..."
  eval git push origin $BRANCH
}
function pull() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  REMOTE="$(git remote)"
  echo "Pulling from branch \e[33m$BRANCH\e[0m on \e[34m$REMOTE\e[0m..."
  eval git pull --rebase $REMOTE $BRANCH
}
function rebase() {
  REMOTE="$(git remote)"
  echo "Rebasing to \e[34m$1\e[0m on $REMOTE..."
  eval git pull --rebase $REMOTE $1
}
function force() {
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  REMOTE="$(git remote)"
  echo "Are you sure you want to force-push to \e[33m$BRANCH\e[0m? \e[34m(y/\e[32;1mN\e[0m)"
  read REPLY
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    eval git push --force-with-lease $REMOTE $BRANCH
  fi
}
function finish() {
  echo "Git add, commit and push..."
  git add -A
  git c -m $1
  push
}

alias composer="php /usr/local/bin/composer.phar"
