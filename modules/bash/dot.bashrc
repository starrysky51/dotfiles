# .bashrc

if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    export PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

PROMPT_COMMAND='add_line'

PS1='\[\e[37;100m\] \# \[\e[90;47m\]\[\e[30;47m\] \w \[\e[37m\]$(__git_ps1 "\[\e[37;102m\] \[\e[30m\] %s \[\e[0;92m\]")\[\e[49m\]\[\e[m\] \$ '

# direnv入れたら2行コメント外す
export EDITOR=vim
eval "$(direnv hook bash)"

# history
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

ONEPASSWORD_SECRET_KEY="A3-WPXMVZ-KZ6XJN-66BMY-PES56-C6SM5-MRHAD"

function random_cowsay() {
  COWS=`brew --prefix`/Cellar/cowsay/3.04/share/cows
  NBRE_COWS=$(ls -1 $COWS | wc -l)
  COWS_RANDOM=$(expr $RANDOM % $NBRE_COWS + 1)
  COW_NAME=$(ls -1 $COWS | awk -F\. -v COWS_RANDOM_AWK=$COWS_RANDOM 'NR == COWS_RANDOM_AWK {print $1}')
  cowsay -f $COW_NAME "`Fortune -s`"
}
if which fortune cowsay >/dev/null; then
  while :
  do
    random_cowsay 2>/dev/null && break
  done
fi && unset -f random_cowsay

alias ll='ls -la'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
