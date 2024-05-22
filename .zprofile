# Start SSH-Agent and add Github SSH key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Sucessfully added Github SSH Key to agent!"
alias desk="cd /mnt/c/Users/Mark/Desktop"
