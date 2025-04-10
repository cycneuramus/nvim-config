require("config.options")

if vim.fn.has("nvim-0.11") ~= 1 then
    vim.o.loadplugins = false
    vim.notify("This config requires neovim 0.11 and above", vim.log.levels.WARN)
    return
end

require("config.lazy")
require("config.keymaps")
require("config.autocmd")
require("config.commands")
require("code.lsp")
require("code.diagnostics")
