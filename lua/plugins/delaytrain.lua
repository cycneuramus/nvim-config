return {
	"ja-ford/delaytrain.nvim",
	event = "VeryLazy",
	config = function()
		require("delaytrain").setup({
			delay_ms = 2000, -- How long repeated usage of a key should be prevented
			grace_period = 2, -- How many repeated keypresses are allowed
			keys = { -- Which keys (in which modes) should be delayed
				["nv"] = { "h", "j", "k", "l" },
				["nvi"] = { "<Left>", "<Down>", "<Up>", "<Right>" },
			},
			ignore_filetypes = {},
		})
	end,
}
