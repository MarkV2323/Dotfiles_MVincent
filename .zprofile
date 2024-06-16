# Start SSH-Agent and add Github SSH key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Sucessfully added Github SSH Key to agent!"
alias desk="cd /mnt/c/Users/Mark/Desktop"

# Allows for easy use of Ctrl-Z for quickly pasuing an app and returning it
# for zsh
_fg () { fg 2> /dev/null }
zle -N _fg
bindkey ^Z _fg
