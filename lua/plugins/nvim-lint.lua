return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			cpp = { "cpplint" },
			css = { "stylelint" },
			html = { "htmlhint" },
			javascript = { "jshint" },
			lua = { "luacheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
