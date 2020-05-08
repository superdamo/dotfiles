# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# window size
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo -e "[${BRANCH}${STAT}\e[32m]\e[0m"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits="\e[37m>${bits}\e[0m"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="\e[34m*${bits}\e[0m"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="\e[32m+${bits}\e[0m"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="\e[35m?${bits}\e[0m"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="\e[36mx${bits}\e[0m"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="\e[31m!${bits}\e[0m"
	fi
	if [ ! "${bits}" == "" ]; then
		echo -e " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\] \n\[\e[33m\]\W\[\e[m\] > "

	#PS1="\[\e[33m\]\W\[\e[m\] \$(__git_ps1 '(%s)') > " 
	#'\[\e[32m\]\u\[\e[m\]:\[\e[33m\]\W\[\e[m\] >'
	PS2=' >'
else
	PS1='\[\e[32m\]\u\[\e[m\]:\[\e[33m\]\W\[\e[m\] >'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tc='pdflatex -interaction=nonstopmode'
alias ost='cd ~/Documents/Link\ to\ Homework/Outstanding'
alias clock='tty-clock -n -s -S -c'
alias st='. $HOME/.startup'
alias jn='jupyter-notebook'

# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#PATH
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:~/.local/bin

#Set Xterm to full colour mode
if [ "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi
