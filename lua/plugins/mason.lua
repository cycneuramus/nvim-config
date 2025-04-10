return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = "MasonToolsUpdate",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"ansible-language-server",
					"bash-language-server",
					"basedpyright",
					"dockerfile-language-server", -- TODO: setup
					"docker-compose-language-service", -- TODO: setup
					"goimports", -- FIXME make conditional on go version
					"gopls", -- FIXME make conditional on go version
					"hadolint", -- TODO: setup (or perhaps skip altogether)
					"lua-language-server",
					"nimlangserver",
					"shellcheck",
					"shfmt",
					"stylua",
				},
				auto_update = true,
			})
		end,
	},
}
