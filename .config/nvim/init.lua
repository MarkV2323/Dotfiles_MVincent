-- IMPORTANT: This is my leader key setting
vim.g.mapleader = " "

-- Non plugin configurations

-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Related to tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enable smart indent
vim.opt.smartindent = false

-- Disable wrapping of text
vim.opt.wrap = false

-- Column for good pratice
vim.opt.colorcolumn = "80"

-- Does not keep search highlighted
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Helps with colors
vim.opt.termguicolors = true

-- Makes scrolling better
vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Not really sure what this does lol
vim.opt.updatetime=200

-- Always open folds
vim.opt.foldlevel=20
-- Requires treesitter for foding
vim.opt.foldmethod="expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Set netrw to display tree style
vim.g.netrw_liststyle=3

-- require package manager lazy.vim
require("config.lazy")

-- require plugin configs after lazy
require("config.plugins")

-- require remaps
require ("config.remaps")
