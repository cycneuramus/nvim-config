vim.lsp.config.pyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "setup.py", "setup.cfg", "requirements.txt", "pyproject.toml" },
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "strict",
                diagnosticSeverityOverrides = {
                    reportMissingTypeStubs = false,
                    reportUnknownLambdaType = false,
                    reportUnknownMemberType = false,
                },
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
