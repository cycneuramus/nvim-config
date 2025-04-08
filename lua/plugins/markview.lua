return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	config = function()
		require("markview").setup({
			markdown = {
				headings = {
					heading_1 = {
						sign_hl = "",
					},
					heading_2 = {
						sign_hl = "",
					},
				},
			},
		})
	end,
}
