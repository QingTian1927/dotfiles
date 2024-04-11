# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=25
SAVEHIST=25
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# -------------------- #
# PROMPT CONFIGURATION #
# -------------------- #

# Colors
# Bold Cyan: \e[1;36m
# Bold Green: \e[1;32m
# Bold Red: \e[1;31m
# Bold Yellow: \e[1;33m]
# Reset: \e[0m

# Prompt
# [username@hostname ~]$ : PS1=$'%{\e[1;36m%}[%n@%m %~]$ %{\e[0m%}'
# $'%{\e[1;32m%}%~ $ %{\e[0m%}'
# $'%{\e[1;36m%}%n@%m %~ > %{\e[0m%}'

setopt PROMPT_SUBST

function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_status() {
  local lines=$(git status --porcelain 2>/dev/null | grep -Ev '^\?\? ' | wc -l)
  if [ ! $lines = 0 ]; then
    echo ' [*]'
  fi
}

function current_battery() {
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -T 'percentage:' | sed -E 's/(\s|percentage:)//g'
}

function current_time() {
  date +%H:%M
}

PS1=$'%{\e[1;32m%}%~%{\e[0m%}%{\e[1;31m%}$(git_branch)%{\e[0m%}%{\e[1;33m%}$(git_status)%{\e[0m%}\n> '

# --------------------- #
# VI MODE CONFIGURATION #
# --------------------- #

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ------- #
# Aliases #
# ------- #

alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -lAh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias fucking='sudo'
# alias syyu='sudo pacman -Syyu'
# alias kittyconfig='nvim ~/.config/kitty/kitty.conf'
# alias libvirtd='sudo systemctl start libvirtd.service'

alias rm='trash -v'
eval $(thefuck --alias)

# Activate zsh-syntax-highlighting (must always be at the EOF)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
