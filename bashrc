# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

stty -ixon

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Go Stuff
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$HOME/bin:$GOPATH/bin

export VCPROMPT_FORMAT="[%n:%b]"
#PS1='$(vcprompt)${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='$(vcprompt)\[\033[01;34m\]\w\[\033[00m\]\$ '

# Bash wrapper to change directory to the output of gocd
gocd () {
  if [ -d "$GOPATH/src/$1" ]; then
    cd "$GOPATH/src/$1"
  fi
}

# I mean why type any more than I have to?
cdnomad() {
  cd $GOPATH/src/github.com/hashicorp/nomad
}

# Optional tab completion wrapper for $GOPATH/src
_gopath () {
  local cur
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  k=0
  for j in $( compgen -f "$GOPATH/src/$cur" ); do
    if [ -d "$j" ]; then
      COMPREPLY[k++]=${j#$GOPATH/src/}
    fi
  done
}  
complete -o nospace -F _gopath gocd 

# be like macOS
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Include local only file if it exists
if [ -f $HOME/.bash_local ]; then
    source "$HOME/.bash_local"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/schmichael/local/google-cloud-sdk/path.bash.inc ]; then
  source '/home/schmichael/local/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/schmichael/local/google-cloud-sdk/completion.bash.inc ]; then
  source '/home/schmichael/local/google-cloud-sdk/completion.bash.inc'
fi

# added by travis gem
[ -f /home/schmichael/.travis/travis.sh ] && source /home/schmichael/.travis/travis.sh

# If a binary isn't in its cached location, look it up on PATH
shopt -s checkhash

# Add timestamp to history
export HISTTIMEFORMAT='%F %T '

# Super critical shortcut
alias shruggie='echo -n "¯\_(ツ)_/¯" | pbcopy'


complete -C nomad nomad

complete -C /home/schmichael/go/bin/nomad nomad
