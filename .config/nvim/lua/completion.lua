-- This is required for 'nvim-compe' to work.
vim.o.completeopt = "menu,menuone,noselect"

-- Setup th luasnip plug-in.
local luasnip = require('luasnip')

-- Enable LSP Kind formatter.
local lspkind = require('lspkind')

-- Setup 'nvim-cmp'.
local cmp = require('cmp')

config = {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<CR>'] = cmp.mapping.confirm({
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            { 'i', 's' }
        ),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua',               keyword_length = 2 },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
}

cmp.setup(config)
