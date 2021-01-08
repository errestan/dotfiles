"
"  Configure LSP.
"

" The following file is written in LUA.

lua <<EOF
vim.cmd('packadd nvim-lspconfig')  -- If installed as a Vim "package".

-- Configure the Clangd language server..
require'lspconfig'.clangd.setup{}

-- Configure the Jedi Python language server.
require'lspconfig'.jedi_language_server.setup{}
EOF

" LSP Key bindings.
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-l> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Use LSP omni-completion in Python files.
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
