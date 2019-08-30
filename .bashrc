export HISTFILESIZE=50000
export HISTSIZE=500000
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history:clear'
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

shopt -s histappend
shopt -s cmdhist

eval "$(rbenv init -)"

PATH=~/bin:${PATH}
PATH=/usr/local/opt/mysql@5.5/bin:${PATH}
PATH=/Users/ed/Downloads/apache-maven-3.2.2/bin:${PATH}
PATH=~/bin:~/bin/mongodb/bin:${PATH}

# PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin/:${PATH}

PATH=/Users/ed/.chefdk/gem/ruby/2.1.0/bin:${PATH}
PATH=~/.cargo/bin:${PATH}

PATH=/usr/local/bin:${PATH}

PATH=/usr/local/opt/openssl/bin:{$PATH}

export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include/sasl"  # https://stackoverflow.com/a/31108577/182677

export PATH

export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib

export USER=ed

export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls="ls -G"

source ~/.git-completion.sh

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\u@lisa \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Git aliases:
alias gst='git status'
alias gd='git diff --color'
alias gdc='git diff --cached --color'
alias gcm='git checkout master'
alias gpm='git pull origin master'

alias whatchanged='for i in $(git whatchanged -m $(cat
VERSION)..master | grep -Eo "[A-Z]{2,8}-[1-9][0-9]{1,3}" | sort -u);
do open https://jira.example.com/browse/$i; done'

export PYTHONDONTWRITEBYTECODE=1

# NVM Setup:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Helper functions:

function vm { ssh edward.dsouza@vm$1.dev.example.com; }
function staging { ssh edward.dsouza@$1.example.com; }
function rg { source ./bin/.nvm/nvm.sh && nvm use; }

z_local_or_github() {
  if [ "$1" = "gh" ]; then
    open "https://github.example.com/example/$2"
  else
    cd "$HOME/Git/$2/"
  fi
}

z_go_jira() {
  TICKET="$(echo "$(git rev-parse --abbrev-ref HEAD)" | egrep -o "^\w+-\d+")"
  open "https://jira.example.com/browse/$TICKET"
}

z_go_ssh() {
  line=$(echo "$1" | grep "\.")
  goto="$1.dev.example.com"
  if [ "$line" ]; then
    goto="$1.example.com"
  fi
  ssh "$goto" -t "sudo \$SHELL --rcfile /home/ed/.bash_profile"
}

z() {
  case "$1" in
    ro    ) lsof -i:8000 -i:8002 -sTCP:LISTEN -t | xargs kill;;
    go    ) z_go_ssh "$2";;
  esac
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
