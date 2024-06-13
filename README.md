# Dotfiles!

This is a collection of all the various dotfiles I use in my Linux user home directory. They mostly have to do with the shell and editor configurations I prefer for my workflow. This repo also serves as a quick start guide in the event I am working on a new environment.

## Terminal colors

I like Gruvbox personally, you will need to search up Terminal themes based on the terminal you use. Depending on your terminal and how it displays colors, you may need to use a newer Terminal. On Mac OSX I prefer iTerm2, which allows for full color support. Windows terminal also has full color support. 

## Z-shell overview

I prefer to use Z-shell over the standard bash (besides, Z-shell is just extended bash). These configurations mostly consist of theming of the shell, some aliases and easy SSH agent & key setup upon login. If you'd like to use these, you need to install Z-shell and copy these dotfiles into your user home directory.

* .zprofile - Contains aliases, SSH agent & key setup, all setup upon login to the shell.
* .zshrc - Contains configurations related to Z-shell itself, such as theme, and plugins.
* .bashrc - Contains a mostly automatically generated, default, configuration from .zshrc installation.

## Neo-Vim overview

I prefer to use Neo-Vim as my text editor of choice, though I have a customized version through plugins that make it more akin to a IDE such as VS Professional or Eclipse. Some the highlights of the plugins I prefer to use include Gruvbox theme, Treesitter for advanced code parsing, and LSP-Zero for easy, all in one LSP support including the managing of Language Servers, Code completion and snippets. You must ensure Neo-Vim & Packer are installed in order to use these configurations. 

* .config - Contains all of my Neo-Vim dotfiles, place in your user home directory (~/)

Inside of `.config/nvim` we can find the following Lua files,

* plugin/gruvboxConfig - Contains configurations related to Gruvbox theme.
* plugin/lsp - Contains configurations related to LSP-Zero plugin.
* plugin/TreeSitConfig - Contains configurations related to Treesitter plugin.
* plugin/ufoConfig - Contains configurations related to Code Folding plugin.

And for the core of our Neo-Vim configuration files we can find,

* lua/mark/init - Ensures the other Lua files are loaded in order.
* lua/mark/plugins - Where our plugin manager (Packer) lives and the plugins we want to download and use via Packer.
* lua/mark/remap - Common key remaps for Neo-Vim that I personally use.
* lua/mark/set - Common VIM related settings that I like.

