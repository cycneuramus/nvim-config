return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "setup.py", "setup.cfg", "requirements.txt", "pyproject.toml" },
    settings = {
        basedpyright = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    reportMissingTypeStubs = false,
                },
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
