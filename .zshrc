#!/usr/bin/sh
# zmodload zsh/zprof


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# zmodload zsh/zprof

export PATH=$HOME/.bin:$HOME/.config/rofi/scripts:$HOME/.local/bin:/usr/local/bin:$PATH

export PATH=~/.npm-global/bin:$PATH

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# ohmyzsh
export ZSH="/usr/share/oh-my-zsh"
# ZSH_THEME="af-magic"
ZSH_THEME="af-magic-custom"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="none"
# ZSH_THEME="pi"
# ZSH_THEME="nothing"
DISABLE_AUTO_UPDATE="true"
plugins=()
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"

# Need forgit
# source /usr/share/zsh/plugins/forgit/forgit.plugin.zsh


# Search by typped letters
# bindkey '^[[a' history-substring-search-up
# bindkey '^[[b' history-substring-search-down
bindkey '^[[1;5A' history-beginning-search-backward
bindkey '^[[1;5B' history-beginning-search-forward
bindkey '^[[a' history-beginning-search-backward
bindkey '^[[b' history-beginning-search-forward

# fzf & fd
[[ -e "/usr/share/fzf/fzf-extras.zsh" ]] && source /usr/share/fzf/fzf-extras.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --preview 'file {}' --preview-window down:1"
export FZF_COMPLETION_TRIGGER="~~"

export TERM="xterm-256color"
# export EDITOR="$(if [[ -n $DISPLAY ]]; then if [[ `which nvim` != 'nvim not found' ]]; then echo 'nvim'; else echo 'vim'; fi; fi)"
export EDITOR="nvim"
export BROWSER="firefox"
export SSH_KEY_PATH="~/.ssh/dsa_id"
export XDG_CONFIG_HOME="$HOME/.config"

export PF_INFO="ascii os kernel wm shell pkgs memory palette"
# export PF_ASCII="arch"

export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"

[[ -f ~/.alias_zsh ]] && . ~/.alias_zsh

# export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
# export PATH="$PATH:`yarn global bin`"

# export GOPATH=$HOME/.go
# export GOBIN=$GOPATH/bin
# export PATH="$PATH:$GOBIN"

# zprof
