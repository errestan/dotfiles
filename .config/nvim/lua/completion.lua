-- This is required for 'nvim-compe' to work.
vim.o.completeopt = "menu,menuone,noselect"

-- Enable LSP Kind formatter.
local lspkind = require('lspkind')

-- Setup 'nvim-cmp'.
local cmp = require('cmp')

config = {
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        format = lspkind.cmp_format({with_text = true, preset = 'default', maxwidth = 50})
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' }
    })
}

cmp.setup(config)

-- Setup LSP Configuration.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup({capabilities = capabilities})
require('lspconfig')['pyright'].setup({capabilities = capabilities})
require('lspconfig')['bashls'].setup({capabilities = capabilities})

-- Setup LSP Saga.
local lspsaga = require('lspsaga')

lspsaga.setup({
    -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- code action title icon
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    border_style = "single",
    rename_prompt_prefix = "➤",
    diagnostic_prefix_format = "%d. ",
})
