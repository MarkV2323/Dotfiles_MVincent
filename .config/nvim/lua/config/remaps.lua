-- Common Remaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Source init.vim
keymap.set("n", "<leader>so", "<cmd>so ~/.config/nvim/init.lua<CR>", opts)

-- NetRw
keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Create sesh
keymap.set("n", "<leader>ss", "<cmd>mksession!<CR>", opts)

-- Save & Exit quickly
keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)
keymap.set("n", "<leader>sq", "<cmd>wq<CR>", opts)

-- Exit search
keymap.set("n", "<leader>h", "<cmd>noh<CR>", opts)

-- Tabs
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", opts)
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", opts)
keymap.set("n", "<leader>1", "1gt", opts)
keymap.set("n", "<leader>2", "2gt", opts)
keymap.set("n", "<leader>3", "3gt", opts)
keymap.set("n", "<leader>4", "4gt", opts)

-- Buffer
keymap.set("n", "<leader>bs", "<cmd>sp<CR>", opts)
keymap.set("n", "<leader>bv", "<cmd>vs<CR>", opts)
keymap.set("n", "<leader><left>", "<c-w><left>", opts)
keymap.set("n", "<leader><right>", "<c-w><right>", opts)
keymap.set("n", "<leader><up>", "<c-w><up>", opts)
keymap.set("n", "<leader><down>", "<c-w><down>", opts)

-- Resize windows
keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Quicker scrollin
keymap.set("n", "<c-y>", "3<c-y>", opts)
keymap.set("n", "<c-e>", "3<c-e>", opts)

-- Join lines without moving cursor
keymap.set('n', 'J', 'mzJ`z', opts)

-- Keep cursor centered when searching
keymap.set('n', 'n', 'nzzzv', opts)
keymap.set('n', 'N', 'Nzzzv', opts)

-- Paste without overwriting clipboard
keymap.set('x', '<leader>p', '"_dP', opts)

-- Yank to system clipboard
keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts)
keymap.set('n', '<leader>Y', '"+Y', opts)

-- Helpful insert mode keybinds
-- <C-a> - Move to beginning of line
-- <C-e> - Move to end of line
-- <C-o> - 1 normal mode cmd
-- <C-h> - backspace
-- <C-w> - backspce word
-- <C-u> - backspace line
-- <C-t> - tab
-- <C-d> - Un tab
-- <C-r>" - Paste from default register
-- <C-r>* - Paste from system clipboard
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode quickly" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })

function ToggleRelativeNumbers()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
    vim.wo.number = true  -- ensure number is on when using relative
  end
end
vim.keymap.set('n', '<leader>n', ToggleRelativeNumbers, { desc = 'Toggle relative line numbers' })

function ToggleWrap()
  vim.wo.wrap = not vim.wo.wrap
  -- Optional: improve experience when wrap is on
  if vim.wo.wrap then
    vim.wo.linebreak = true       -- wrap at word boundaries
    vim.opt.showbreak = '↪ '      -- show nice wrap symbol
    print("Wrap: ON")
  else
    vim.wo.linebreak = false
    print("Wrap: OFF")
  end
end
vim.keymap.set('n', '<leader>z', ToggleWrap, { desc = 'Toggle word wrap' })
