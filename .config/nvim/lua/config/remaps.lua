-- Common Remaps

-- Source init.vim
vim.keymap.set("n", "<leader>so", "<cmd>so ~/.config/nvim/init.lua<CR>")

-- NetRw
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Create sesh
vim.keymap.set("n", "<leader>ss", "<cmd>mksession!<CR>")

-- Save & Exit quickly
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>sq", "<cmd>wq<CR>")

-- Exit search
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>")

-- Tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")

-- Buffer
vim.keymap.set("n", "<leader>bs", "<cmd>sp<CR>")
vim.keymap.set("n", "<leader>bv", "<cmd>vs<CR>")
vim.keymap.set("n", "<leader><left>", "<c-w><left>")
vim.keymap.set("n", "<leader><right>", "<c-w><right>")
vim.keymap.set("n", "<leader><up>", "<c-w><up>")
vim.keymap.set("n", "<leader><down>", "<c-w><down>")

-- Quicker scrollin
vim.keymap.set("n", "<c-y>", "3<c-y>")
vim.keymap.set("n", "<c-e>", "3<c-e>")

