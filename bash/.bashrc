# Git prompt
. ~/.git-prompt.sh

# Custom prompt (using Git prompt)
GIT_PS1_SHOWDIRTYSTATE=Y
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=Y

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# Bash autocompletion
. /etc/profile.d/bash_completion.sh

# Environment variables
export HISTCONTROL=ignoreboth                                  # History will not include commands with leading white space chars nor duplicates
export PATH=$PATH:/usr/local/go/bin

# Aliases
alias ll='ls -laFh' # long listing, all, classify, human-readable
alias less='less -RNi' #show colors, line numbers; ignore case when searching
