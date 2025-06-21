# Dotfiles!

This is a collection of all the various dotfiles I use in my Linux user home directory. They mostly have to do with the shell and editor configurations I prefer for my workflow. This repo also serves as a quick start guide in the event I am working on a new environment.

## Terminal colors

I like Gruvbox personally, you will need to search up Terminal themes based on the terminal you use. Depending on your terminal and how it displays colors, you may need to use a newer Terminal. On Mac OSX I prefer iTerm2, which allows for full color support. Windows terminal also has full color support. 

## Shell overview

* .bash_profile - Contains useful alias, SSH key setup and prompt configuration. You should use this as your `.bashrc` if you are not running zsh.

## Neo-Vim overview

I prefer to use Neo-Vim as my text editor of choice. Read through the files in .config/nvim/ to see details, I use Lazy for plugin mangement.

* .config - Contains all of my Neo-Vim dotfiles, place in your user home directory (~/)
