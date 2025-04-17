local lsputil = require("utils/lsp")

vim.lsp.config.nimlangserver = {
    cmd = { "nimlangserver" },
    cmd_env = {
        HOME = vim.fn.expand("~/.local/share/nim"),
    },
    filetypes = { "nim" },
    root_dir = lsputil.root_globs({ "*.nimble" }),
    settings = {
        nim = {
            notificationVerbosity = "error",
            autoCheckFile = true,
            autoCheckProject = false,
        },
    },
}
