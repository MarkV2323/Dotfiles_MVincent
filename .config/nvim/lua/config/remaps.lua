local keymap = vim.keymap

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🧰 General Utilities                                         │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>so", function()
  -- Unload all lua modules under 'mark' (adjust to your namespace)
  for name,_ in pairs(package.loaded) do
    if name:match("^mark") then  -- change 'mark' to your lua config root if different
      package.loaded[name] = nil
    end
  end
  -- Reload init.lua
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Neovim config reloaded!")
end, { desc = "Reload all Lua config files" })
keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear search highlight" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 💾 File & Session Control                                    │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write/save buffer" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit current window" })
keymap.set("n", "<leader>sq", "<cmd>wq<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>ss", "<cmd>mksession!<CR>", { desc = "Save current session" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 📂 File Navigation                                           │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>rw", vim.cmd.Ex, { desc = "Open NetRW (file explorer)" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🗂️ Tab Control                                               │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Tab Open new tab" })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab Close current tab" })
keymap.set("n", "<leader>1", "1gt", { desc = "Tab Go to tab 1" })
keymap.set("n", "<leader>2", "2gt", { desc = "Tab Go to tab 2" })
keymap.set("n", "<leader>3", "3gt", { desc = "Tab Go to tab 3" })
keymap.set("n", "<leader>4", "4gt", { desc = "Tab Go to tab 4" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 📑 Split Navigation & Resize                                 │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<leader>bs", "<cmd>sp<CR>", { desc = "Window Horizontal split" })
keymap.set("n", "<leader>bv", "<cmd>vs<CR>", { desc = "Window Vertical split" })
keymap.set("n", "<leader><left>", "<c-w><left>", { desc = "Window Move to left split" })
keymap.set("n", "<leader><right>", "<c-w><right>", { desc = "Window Move to right split" })
keymap.set("n", "<leader><up>", "<c-w><up>", { desc = "Window Move to upper split" })
keymap.set("n", "<leader><down>", "<c-w><down>", { desc = "Window Move to lower split" })

keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Window Decrease window height" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Window Increase window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Window Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Window Increase window width" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 🏃 Scroll Enhancements                                       │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "<C-y>", "3<C-y>", { desc = "Scroll up faster" })
keymap.set("n", "<C-e>", "3<C-e>", { desc = "Scroll down faster" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ ✂️ Editing Enhancements                                      │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })
keymap.set("n", "n", "nzzzv", { desc = "Search next and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Search prev and center" })
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 📋 Yank & Clipboard                                          │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- ╭──────────────────────────────────────────────────────────────╮
-- │ 📝 Insert Mode Shortcuts                                     │
-- ╰──────────────────────────────────────────────────────────────╯
keymap.set("i", "jj", "<Esc>", { desc = "Insert Exit insert mode quickly" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Insert Move right" })
keymap.set("i", "<C-h>", "<Left>", { desc = "Insert Move left" })
keymap.set("i", "<C-a>", "<Home>", { desc = "Insert Move to beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "Insert Move to end of line" })
keymap.set("i", "<C-h>", "<BS>", { desc = "Insert Backspace character" })
keymap.set("i", "<C-w>", "<C-w>", { desc = "Insert Backspace word" })
keymap.set("i", "<C-u>", "<C-u>", { desc = "Insert Backspace to line start" })
keymap.set("i", "<C-t>", "<Tab>", { desc = "Insert Insert tab" })
keymap.set("i", "<C-d>", "<Del>", { desc = "Insert Delete character under cursor" })
keymap.set("i", "<C-o>", "<C-o>", { desc = "Insert Execute one normal mode command" })
keymap.set("i", "<C-r>\"", '<C-r>"', { desc = "Insert Paste from default register" })
keymap.set("i", "<C-r>*", '<C-r>*', { desc = "Insert Paste from system clipboard" })

-- Functions

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

-- Allows for clang-format to be called on save of C++ files
function ClangFormat()
  local filepath = vim.fn.expand("%:p")
  os.execute("clang-format -i " .. filepath)
  vim.cmd("edit!")
end
vim.keymap.set('n', '<leader>F', ClangFormat, { desc = 'Format a C++ file' })

