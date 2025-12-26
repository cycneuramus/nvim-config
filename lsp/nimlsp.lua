local lsputil = require("utils/lsp")

return {
    cmd = { "nimlsp" },
    cmd_env = {
        HOME = vim.fn.expand("~/.local/share/nim"),
    },
    filetypes = { "nim" },
    root_dir = lsputil.root_globs({ "*.nimble" }),
}
