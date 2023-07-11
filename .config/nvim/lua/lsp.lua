local lspconfig = require('lspconfig')

require('lsp-format').setup()

local on_attach = function(client, bufnr)
    -- Enable LSP Formatting.
    require('lsp-format').on_attach(client)

    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl',
        function()
            vim.inspect(vim.lsp.buf.list_workspace_folders())
        end,
        opts
    )
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()

lua_settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
    },
}

-- Iterate over a table of language servers and initialise them.
local servers = { { server = "clangd" }, { server = "pyright" }, { server = "bashls" },
    { server = "lua_ls", settings = lua_settings }, }
for _, lsp in ipairs(servers) do
    lspconfig[lsp.server].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = lsp.settings,
    }
end

require('rust-tools').setup()
