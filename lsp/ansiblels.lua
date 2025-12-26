return {
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml.ansible" },
    root_markers = { "inventory.yml" },
    single_file_support = true,
    settings = {
        ansible = {
            ansible = { useFullyQualifiedCollectionNames = false },
            executionEnvironment = { enabled = false },
            validation = {
                enabled = true,
                lint = { enabled = true, path = "ansible-lint" },
            },
        },
    },
}
