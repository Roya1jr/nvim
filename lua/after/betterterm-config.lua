local betterTerm = require('betterTerm')
betterTerm.setup()
-- toggle firts term
vim.keymap.set({ "n", "t" }, "<C-ñ>", betterTerm.open, { desc = "Open terminal" })
-- Select term focus
vim.keymap.set({ "n", "t" }, "<space>pt", betterTerm.select, { desc = "Select terminal" })
-- Create new term
local current = 2
vim.keymap.set(
	{ "n", "t" }, "<space>pn",
	function()
		betterTerm.open(current)
		current = current + 1
	end,
	{ desc = "New terminal" }
)
