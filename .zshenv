export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export SAVEHIST=500000
export HISTSIZE=500000
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history:clear'
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

PATH=~/bin:${PATH}
PATH=/usr/local/bin:${PATH}
PATH=/usr/local/opt/openssl/bin:{$PATH}

export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include/sasl"  # https://stackoverflow.com/a/31108577/182677

export PATH

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

export USER=ed

export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls="ls -G"

export PS1="\u@lisa \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export NVM_DIR="$HOME/.nvm"
.   "/usr/local/opt/nvm/nvm.sh"

# Git aliases:
alias gst='git status'
alias gd='git diff --color'
alias gdc='git diff --cached --color'
alias gcm='git checkout master'
alias gpm='git pull origin master'

export PYTHONDONTWRITEBYTECODE=1

# NVM Setup:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
