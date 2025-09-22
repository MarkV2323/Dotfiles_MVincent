PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[38;5;255;1m\]\d\[\e[0m\] (\[\e[38;5;123;1m\]${PS1_CMD1}\[\e[0m\]) \[\e[38;5;178;1m\]\w\n\[\e[38;5;196m\]>\[\e[0m\] '

# Env var items
export DOCS="$HOME/Documents"
export NVIM_HOME="$HOME/.config/nvim"
export BASH_PROFILE="$HOME/.bash_profile"
export DOTFILES_HOME="$DOCS/Dotfiles_MVincent"

# Check what venv you are in
export INVENV=$(python3 -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')

# Start SSH-Agent and add Github SSH key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/git_key_ed25519
echo "Sucessfully added Github SSH Key to agent!"

# PATH related items
export NVIM_HOME="/opt/nvim-linux64"
export VCPKGHOME="/opt/vcpkg"
export VCPKGCMAKE="$VCPKGHOME/scripts/buildsystems/vcpkg.cmake"
export CMAKEHOME="/opt/cmake-4.1.0-linux-x86_64"

export VISUAL="$NVIM_HOME/bin/nvim"
export EDITOR="$NVIM_HOME/bin/nvim"

export PATH="$PATH:$NVIM_HOME/bin"
export PATH="$PATH:$VCPKGHOME"
export PATH="$PATH:$CMAKEHOME/bin"

# history
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoredups

# bash rc
alias bso="source ~/.bashrc"
alias bsh="nvim ~/.bash_profile"
alias nconf="nvim ~/.config/nvim"

# For updating local dotfiles
alias getdotfiles="cp -r $DOTFILES_HOME/.config/nvim $HOME/.config"
alias getbashprofile="cp $DOTFILES_HOME/.bash_profile $HOME/.bash_profile"

# For updating git dotfiles with local dotfiles
alias updatedf="cp -r $HOME/.config/nvim $DOTFILES_HOME/.config"
alias updatebash="cp $HOME/.bash_profile $DOTFILES_HOME/.bash_profile"

# general
alias h="history"
alias c="clear"

# ls
alias ls="ls -a --color=auto"
alias l="ls -CF"
alias ll="ls -alF"
alias lt="ls -alFt"

# git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gr="git remove"

# cd
alias ..="cd .."
alias ...="cd../.."

# python
alias python="python3"
alias py="python"

# cmake
alias cbuild="cmake -B build/ -DCMAKE_TOOLCHAIN_FILE=$VCPKGCMAKE && cmake --build build/"

alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'

# nordvpn
alias vpnc='nordvpn c Denver'
alias vpnd='nordvpn d'

# playerctl (spotify)
alias pc='playerctl'
alias pcpl='pc play'
alias pcp='pc pause'
alias pcn='pc next'
alias pcl='pc previous'

cd() { # automatic cd
    builtin cd "$@" && ll
}

fawk() { # extract column output from command (df -h | fawk 2)
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

extract() { # extract files. Ignore files with improper extensions.
    local x
    ee() { # echo and execute
        echo "$@"
        $1 "$2"
    }
    for x in "$@"; do
        [[ -f $x ]] || continue
        case "$x" in
            *.tar.bz2 | *.tbz2 )    ee "tar xvjf" "$x"  ;;
            *.tar.gz | *.tgz ) ee "tar xvzf" "$x"   ;;
            *.bz2 )             ee "bunzip2" "$x"   ;;
            *.rar )             ee "unrar x" "$x"   ;;
            *.gz )              ee "gunzip" "$x"    ;;
            *.tar )             ee "tar xvf" "$x"   ;;
            *.zip )             ee "unzip" "$x"     ;;
            *.Z )               ee "uncompress" "$x" ;;
            *.7z )              ee "7z x" "$x"      ;;
        esac
    done
}
