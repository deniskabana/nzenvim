export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_AUTO_TITLE="true"
plugins=(git vi-mode zsh-autosuggestions sudo)
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
source $ZSH/oh-my-zsh.sh
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

alias fzf='~/.fzf/bin/fzf'

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
  git commit -m $1
  push
}

source /home/denis/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
