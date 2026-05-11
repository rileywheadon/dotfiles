# ~/.bashrc

# Add user binaries to path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux -f ~/.tmux.conf
fi

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias kc='kubectl'
alias vim='nvim'
alias nv='nvim'

# Run starship
eval "$(starship init bash)"

# Set the default editor and visual editor to vim
set -o vi
export EDITOR=vim
export VISUAL=vim

# Set up autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Set a path for screenshots
HYPRSHOT_DIR='~/Screenshots'

# Add linuxbrew to the path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# opencode
export PATH=/home/rileywheadon/.opencode/bin:$PATH
