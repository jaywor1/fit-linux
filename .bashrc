#
# ~/.bashrc
#

install() {
  echo "install"
  apt update && \
    apt install -y bash-completion git
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bash_completion.d/ssh ]; then
    . /etc/bash_completion.d/ssh
fi


NC='\[\033[0m\]'
RED='\[\033[0;31m\]'
YELLOW='\[\033[0;33m\]'
PURPLE='\[\033[0;36m\]'

PS0="[ ${PURPLE}\t${NC} ]: \$?\n"
PS1="[ ${RED}\u${NC}@\h ${YELLOW}/\W${NC} ]\\> "

#############
# Functions #
#############

jayclone(){
	git clone "git@github.com:jaywor1/$1.git"
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    GROFF_NO_SGR=1 \
    MANPAGER='less -s -M +Gg' \
    command man "$@"
}

createsharp() {
  dotnet new console --use-program-main -n $1
}

## Color aliases
export TERM=xterm-256color
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias ip='ip -c'

## files / autoverbose
alias 'rm'='rm -v'
alias 'cp'='cp -vi'
alias 'mv'='mv -vi'
alias 'mkdir'='mkdir -p'
alias 'mount'='mount -v'
alias 'umount'='umount -v'

## Just shortcuts
alias 'pg'='ping 8.8.8.8'
alias 'mkinitcpio'='sudo mkinitcpio -p linux'

## Allow CTRL+C
alias 'sl'='sl -e'

## Git aliases
# Custom git alias
alias cdd='cd $(git rev-parse --show-toplevel)'
# Implemented git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcl='git clone --recurse-submodules'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gsb='git status --short --branch'
alias gpsuo='git push --set-upstream origin'

## Sudo aliases
### Autocomplete for sudo
alias sudo='sudo '
### Short sudo
alias s='sudo '
alias systemctl=' sudo systemctl'

## History
### Apend history to history file instead of overwriting
shopt -s histappend
### Preserve history in multiple terminator instances
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

## Autoparameters
alias clear='clear -x'
alias la='ls -laht'


if [[ "$TERM" =~ xterm*|rxvt* ]] ; then
	PS1="\[\e]0;\u@\h: \w\a\]$PS1"
fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Set the default editor
export EDITOR=vim
export VISUAL=vim


# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
