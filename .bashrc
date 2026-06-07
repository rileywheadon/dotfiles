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
alias c='clear'
alias e='exit'

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

# Set up SSH agent
systemctl --user enable --now ssh-agent.service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# install Conda for CPSC330 (can remove after 2026-06-30)
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rileywheadon/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rileywheadon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rileywheadon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rileywheadon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

