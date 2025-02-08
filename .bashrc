#
# ~/.bashrc
#

export LC_ALL="en_US.UTF8"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# appearance
PS1='\n \[\033[01;34m\]$\[\033[0m\] '
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# make directory and change to it
function mcd
{
  command mkdir $1 && cd $1
}

# fzf
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--color gutter:-1 --no-separator --no-scrollbar --preview-window noinfo --border none --preview-window=border-left"
alias vimf='vim $(fzf -m)' 
