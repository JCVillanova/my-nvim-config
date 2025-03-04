return {
	"tamton-aquib/duck.nvim",
	config = function()
		vim.keymap.set("n", "<leader>ddd", function()
			require("duck").hatch()
		end, {})
		vim.keymap.set("n", "<leader>ddk", function()
			require("duck").cook()
		end, {})
		vim.keymap.set("n", "<leader>dda", function()
			require("duck").cook_all()
		end, {})
	end,
}
