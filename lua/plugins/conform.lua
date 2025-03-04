return {
	"stevearc/conform.nvim",
	require("conform").setup({
		formatters_by_ft = {
			cpp = { "clang-format" },
			csharp = { "csharpier" },
			css = { "css_beautify" },
			html = { "html_beautify" },
			javascript = { "js_beautify" },
			lua = { "stylua" },

			["*"] = { "codespell" },
			["_"] = { "trim_whitespace", "trim_newlines" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		notify_on_error = true,
		notify_no_formatters = true,
		formatters = {
			-- Customize formatters' settings here
		},
	}),
}
