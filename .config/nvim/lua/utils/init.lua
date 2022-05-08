local utils = { }

function utils.source_if_exists(file)
    local path = vim.fn.stdpath("config") .. '/' .. file

    if vim.fn.filereadable(path) == 1 then
        vim.cmd("luafile " .. path)
    end
end

return utils
