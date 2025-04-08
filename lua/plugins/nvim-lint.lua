return {
	"mfussenegger/nvim-lint",
	-- NOTE: plugin is disabled
	enabled = false,
	config = function()
		local lint = require("lint")
		local events = { "BufReadPost", "BufWritePost", "InsertLeave" }

		lint.linters_by_ft = {
			dockerfile = { "hadolint" },
		}

		vim.api.nvim_create_autocmd(events, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
