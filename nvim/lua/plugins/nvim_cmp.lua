--
-- nvim_cmp.lua
-- LSPクライアント周りの設定
--

local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require('lspkind')
lspkind.setup({})

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = function(callback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn.col('.') == 1 or vim.fn.getline('.'):sub(vim.fn.col('.') -1, vim.fn.col('.') -1):match('%s') then
                callback()
            else
                cmp.complete()
            end
        end,
        ["<S-Tab"] = function(callback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                callback()
            end
        end,
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ['<C-l>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = false,
    },
    formatting = {
        format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

vim.cmd [[
  highlight CmpItemKindFunction guifg=#0000FF
  highlight CmpItemKindVariable guifg=#00FF00
]]
