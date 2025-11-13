return {
  --------------------------------------------------------------------
  -- Treesitter
  --------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "vim", "vimdoc", "cpp", "cmake", "make", "python"},
        sync_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      }

      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end,
  },

  --------------------------------------------------------------------
  -- LuaSnip + friendly-snippets
  --------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require("luasnip")

      -- Snippet keymaps
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, { desc = "Luasnip Expand snippet" })
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, { desc = "Luasnip Jump to next snippet placeholder" })
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, { desc = "Luasnip Jump to previous snippet placeholder" })
      vim.keymap.set({"i", "s"}, "<C-E>", function()
          if ls.choice_active() then
              ls.change_choice(1)
          end
      end, { desc = "Luasnip Cycle through snippet choices" })

      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  --------------------------------------------------------------------
  -- Telescope
  --------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = 'Telescope List Keymaps' })
    end,
  },

  --------------------------------------------------------------------
  -- Mason + LSP
  --------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
        handlers = {
          function(server_name)
            vim.lsp.start(vim.lsp.config[server_name]({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
              cmd = {"clangd", "--compile-commands-dir=build"},
              root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
            }))
          end,
        },
      })

      -- Common LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },

  --------------------------------------------------------------------
  -- CMP (completion engine)
  --------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                  cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
              else
                  fallback()
              end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
    end,
  }
}

