# ~/.bashrc

# Add user binaries to path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias kc='kubectl'
PS1='[\u@\h \W]\$ '

# Run starship
eval "$(starship init bash)"

# Set the default editor and visual editor to vim
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
