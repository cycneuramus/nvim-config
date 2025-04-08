local capabilities = {
	-- semanticTokensProvider = nil,
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
	on_attach = function(client, _)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

local lsputil = require("utils/lsp")

-- Nim
vim.lsp.config.nim_langserver = {
	cmd = { "nimlangserver" },
	cmd_env = {
		HOME = vim.fn.expand("~/.local/share/nim"),
	},
	filetypes = { "nim" },
	root_dir = lsputil.root_globs({ "*.nimble" }),
	-- single_file_support = true,
	settings = {
		nim = {
			-- nimSuggestPath = "~/.local/share/nim/.nimble/bin/nimsuggest",
			notificationVerbosity = "error",
			autoCheckFile = true,
			autoCheckProject = false,
		},
	},
}
vim.lsp.enable("nim_langserver")

-- Go
vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.mod" },
}
vim.lsp.enable("gopls")

-- Python
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
					reportUnknownMemberType = false,
				},
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
vim.lsp.enable("pyright")

-- Bash
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
	single_file_support = true,
}
vim.lsp.enable("bashls")

-- Ansible
vim.lsp.config.ansiblels = {
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
vim.lsp.enable("ansiblels")

-- Lua
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { "lazy-lock.json" },
	-- single_file_support = true,
	-- log_level = 2,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library",
					-- "${3rd}/busted/library",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
vim.lsp.enable("lua_ls")
