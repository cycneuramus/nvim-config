local lsputil = require("utils/lsp")

return {
    cmd = { "nimlangserver" },
    filetypes = { "nim" },
    root_dir = lsputil.root_globs({ "*.nimble" }),
    single_file_support = true,
    settings = {
        nim = {
            notificationVerbosity = "none",
            formatOnSave = false,
            checkOnSave = true,
            autoCheckFile = true,
            autoCheckProject = false,
            autoRestart = true,
        },
    },
}
