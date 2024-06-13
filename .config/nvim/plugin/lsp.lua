local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

vim.g.lsp_zero_ui_float_border = "rounded"

-- here you can setup the language servers

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"bashls", "clangd", "cssls", "html", "tsserver"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

require('lsp-zero').extend_cmp()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between completion item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    -- Toggle completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    
    -- Abort completion
    ['<C-e>'] = cmp.mapping.abort(),

    -- Navigate between snipper placeholders
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered({
        border = "rounded",
    }),
    documentation = cmp.config.window.bordered({
        border = "rounded",
    }),
  },
})

