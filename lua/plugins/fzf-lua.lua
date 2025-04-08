return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			files = {
				cmd = "fd --type f --color=always --exclude '.git' --exclude '.cache'",
			},
			fzf_colors = {
				true,
			},
		})
	end,
}
