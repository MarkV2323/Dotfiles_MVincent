-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Place plugins here 
-- * I use GruvBox for my theme
-- * I use nVim-UFO for code folding
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Gruvbox color theme
  use { "ellisonleao/gruvbox.nvim" }

  -- UFO code folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Treesitter code linter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    }

end)
