# 2025-03-18 .zshrc by ph2xc8
# dependencies: fzf, zsh-syntax-highlighting
# zsh as default shell: sudo chsh -s $(which zsh)

# Add all directories in `~/.local/bin` to $PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

unsetopt PROMPT_SP 2>/dev/null

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER="librewolf"

# === basic settings===
setxkbmap pl
# auto-complete
autoload -Uz compinit
compinit

# history
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTSIZE=10000                
SAVEHIST=10000                
setopt HIST_IGNORE_DUPS      
setopt HIST_IGNORE_SPACE      
setopt SHARE_HISTORY          
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# === prompt view ===
PROMPT='%F{blue}[%n]%f in %F{green}[%~]%f > '

# === alias ===
alias la='ls -A'              
alias l='ls -CF'              
alias ..='cd ..'              
alias ...='cd ../..'          
alias g='git'                 
alias ll='ls -alFh'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias cls='clear'
# alias dir='vdir --color=auto --group-directories-first'
alias dir='~/sh/show.sh'
alias sapt='sudo apt -y'
alias vi='nvim'
alias mkd='mkdir -pv'
alias ww='cd ~/Documents/vimwiki && nvim index.md'
#alias ls='ls -1Nh --color=auto --group-directories-first'
alias vimc='nvim ~/.config/nvim/init.vim'
alias gst='git status'
alias gcm='git commit -m'
alias gpo='git push origin'
alias news='newsboat'
alias vibm='nvim ~/.local/share/MISC/bookmarks'
alias yt='yt-dlp --embed-metadata -i -f "bv*[height<=1080][fps<=30]+ba/b[height<=1080][fps<=30] / bv*+ba/b" --merge-output-format mp4'
alias yta='yt -x -f bestaudio/best'

# === flag copletion ===
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'l:|=*' '+r:|=*'
zstyle ':completion:*' format 'completion: %d'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B%F{red}->:%f%b %d'

# === ls colors ===
if command -v dircolors &> /dev/null; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

# History in cache directory:
setopt inc_append_history

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lfub -print-last-dir "$@")"
}
alias lf='lfcd'

bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# Load syntax highlighting; should be last.
# That one within plugins dir should work on archlinux btw
# if using debian source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
