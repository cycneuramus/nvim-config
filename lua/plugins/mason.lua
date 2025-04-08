return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	event = "BufReadPre",
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"ansible-language-server",
				-- "ansible-lint",
				"bash-language-server",
				"basedpyright",
				"dockerfile-language-server", -- TODO:
				"docker-compose-language-service", -- TODO:
				"goimports",
				"gopls",
				"hadolint",
				"lua-language-server",
				"nimlangserver",
				"shellcheck",
				"shfmt",
				"stylua",
			},
		})
	end,
}
