if vim.fn.has("nvim-0.11") ~= 1 then
    vim.defer_fn(function()
        vim.notify("This config requires neovim 0.11 and above", vim.log.levels.WARN)
    end, 100)

    vim.o.loadplugins = false
    vim.o.loadplugins = false
    return
end

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.commands")
require("code.lsp")
require("code.diagnostics")
