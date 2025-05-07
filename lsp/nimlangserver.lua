local lsputil = require("utils/lsp")

vim.lsp.config.nimlangserver = {
	cmd = { "nimlangserver" },
	cmd_env = {
		HOME = vim.fn.expand("~/.local/share/nim"),
	},
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
