-- Set default line length.
vim.g.black_linelength = 110

-- Automatically run Black when saving Python files.
vim.cmd([[autocmd BufWritePre *.py execute ':Black']])
