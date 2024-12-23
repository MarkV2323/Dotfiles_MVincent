# Prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='(\[\e[1m\]${PS1_CMD1}\[\e[0m\]) \[\e[32m\]\u\[\e[92m\]@\[\e[32m\]\H\[\e[0m\] \[\e[91m\]\w\[\e[0m\] \[\e[97m\]>\[\e[0m\]'

# Add Neovim to the path
export PATH="$PATH:/opt/nvim-linux64/bin"

# Start SSH-Agent and add Github SSH key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/git_key_ed25519
echo "Sucessfully added Github SSH Key to agent!"

# Check what venv you are in
INVENV=$(python3 -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')

alias bso="source ~/.bash_profile"
alias bsh="nvim ~/.bash_profile"

alias st="git status"
alias gd="git diff"
alias ga="git add"

alias python="python3"
alias py="python"

# Neovim related
alias neoconfig="nvim ~/.config/nvim/"

