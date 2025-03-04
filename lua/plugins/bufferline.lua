return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icons = {
						error = "",
						warning = "",
						info = "󰙎",
						hint = "",
					}
					local s = ""
					local severities = { "error", "warning", "info", "hint" }
					for _, severity in ipairs(severities) do
						if diagnostics_dict[severity] and diagnostics_dict[severity] > 0 then
							s = s .. icons[severity] .. diagnostics_dict[severity]
						end
					end
					return s
				end,
				diagnostics_update_in_insert = true,
				-- groups = {
				-- 	options = {
				-- 		toggle_hidden_on_enter = true,
				-- 	},
				-- 	items = {
				-- 		{
				-- 			name = "Tests",
				-- 			highlight = { underline = true, sp = "blue" },
				-- 			auto_close = false,
				-- 			priority = 0,
				-- 			icon = " ",
				-- 			matcher = function(buf)
				-- 				return buf.filename:match("test") or buf.filename:match("Test")
				-- 			end,
				-- 		},
				-- 		{
				-- 			name = "C++ Headers",
				-- 			highlight = { undercurl = true, sp = "yellow" },
				-- 			auto_close = false,
				-- 			priority = 1,
				-- 			matcher = function(buf)
				-- 				return buf.filename:match("%.h")
				-- 			end,
				-- 		},
				-- 		{
				-- 			name = "C++",
				-- 			highlight = { undercurl = true, sp = "green" },
				-- 			auto_close = false,
				-- 			priority = 2,
				-- 			matcher = function(buf)
				-- 				return buf.filename:match("%.cpp")
				-- 			end,
				-- 		},
				-- 	},
				-- },
				hover = {
					enabled = true,
					delay = 50,
					reveal = { "close" },
				},
				numbers = function(opts)
					return string.format("%s", opts.raise(opts.ordinal))
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
						text_align = "left",
					},
				},
				show_tab_indicators = true,
				indicator = { style = "underline" },
				separator_style = "slope",
			},
		})
	end,
}
