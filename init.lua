require("config.options")

if vim.fn.has("nvim-0.11") ~= 1 then
    vim.o.loadplugins = false
    vim.notify("This config requires neovim 0.11 and above", vim.log.levels.WARN)
    return
end

local modules = {
    "config.lazy",
    "config.keymaps",
    "config.autocmd",
    "config.commands",
    "config.lsp",
    "config.diagnostics",
}

for _, module in pairs(modules) do
    local success = pcall(require, module)
    if not success then
        vim.notify("Failed to load a config module: " .. module)
        break
    end
end
