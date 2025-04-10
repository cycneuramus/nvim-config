return {
	"shortcuts/no-neck-pain.nvim",
	ft = "markdown",
	config = function()
		local nord = require("nord.colors").palette
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = nord.polar_night.origin })

		require("no-neck-pain").setup({
			killAllBuffersOnDisable = true,
			autocmds = {
				enableOnVimEnter = true,
				skipEnteringNoNeckPainBuffer = true,
			},
			buffers = {
				wo = {
					fillchars = "eob: ",
				},
			},
		})
	end,
}
