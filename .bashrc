# Vi mode
set -o vi
export EDITOR="nvim"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias kc='kubectl'
alias nv='nvim'
alias vim='nvim'

# Configure browser for WSL
export BROWSER="explorer.exe"

# Configure $PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH" # krew (kubectl package manager)
export PATH="$PATH:/snap/bin"                     # snap (Ubuntu package manager)
export PATH=${PATH}:`go env GOPATH`/bin           # Golang
export PATH="$HOME/.local/bin:$PATH"              # local scripts

# Start tmux automatically
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
	tmux attach -t home 
fi

# Starship (terminal prompt)
eval "$(starship init bash)"
