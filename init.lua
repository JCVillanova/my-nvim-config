-- luacheck: globals vim
require("config.lazy")

-- Basic stuff
vim.wo.number = true

vim.cmd([[highlight DiagnosticHintNumhl guifg=#D2ABD2 ctermfg=141]]) -- custom hint color
vim.diagnostic.config({
	float = {
		border = "rounded",
		format = function(diagnostic)
			return string.format("%s (%s)", diagnostic.message, diagnostic.source)
		end,
		scope = "l",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
		linehl = {
			[vim.diagnostic.severity.WARN] = "WarnMsg",
			[vim.diagnostic.severity.INFO] = "InfoMsg",
			[vim.diagnostic.severity.HINT] = "HintMsg",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.INFO] = "InfoMsg",
			[vim.diagnostic.severity.HINT] = "DiagnosticHintNumhl",
		},
	},
	underline = true,
	update_in_insert = true,
	virtual_lines = false,
	virtual_text = false,
})
vim.g.python3_host_prog = "/usr/bin/python3"
vim.opt.mousemoveevent = true
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")
vim.g.lazyvim_picker = "snacks"

-- LSPs
require("lspconfig").clangd.setup({})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "cpp", "lua", "html", "css", "javascript" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},
})
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
