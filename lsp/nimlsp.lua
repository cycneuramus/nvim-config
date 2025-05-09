local lsputil = require("utils/lsp")

vim.lsp.config.nimlsp = {
    cmd = { "nimlsp" },
    cmd_env = {
        HOME = vim.fn.expand("~/.local/share/nim"),
    },
    filetypes = { "nim" },
    root_dir = lsputil.root_globs({ "*.nimble" }),
}
