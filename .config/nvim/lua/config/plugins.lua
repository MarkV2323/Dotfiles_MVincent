-- Use gruvbox colorscheme (installed via lazy)
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Configure TREE sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "cpp", "cmake", "make", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },

}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Configure Lua Snippets
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, { desc = "Luasnip Expand snippet" })
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, { desc = "Luasnip Jump to next snippet placeholder" })
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, { desc = "Luasnip Jump to previous snippet placeholder" })
vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { desc = "Luasnip Cycle through snippet choices" })

-- Load snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- https://github.com/rafamadriz/friendly-snippets/tree/main/snippets
-- Configure Telescoping
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>km", function()
  require('telescope.builtin').keymaps()
end, { desc = "Telescope List Keymaps" })

