return {
	"nvim-tree/nvim-web-devicons",
	enabled = true,
	event = "VeryLazy",
	config = function()
		require("nvim-web-devicons").setup({
			override_by_extension = {
				["sh"] = {
					icon = "",
				},
			},
		})
	end,
}
