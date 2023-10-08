-- Save
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

--Copy to clipboard
vim.keymap.set({ "n", "x" }, "cp", '"+y')

--Paste from clipboard
vim.keymap.set({ "n", "x" }, "cv", '"+p')

--Delete using x without changing the registers
vim.keymap.set({ "n", "x" }, "x", '"_x')

--Buffer
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Buffer Next" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Buffer Previous" })

--Panes
vim.keymap.set("n", "<leader>oh", "<C-W>h", { desc = "Go to left pane" })
vim.keymap.set("n", "<leader>oj", "<C-W>j", { desc = "Go to bottom pane" })
vim.keymap.set("n", "<leader>ok", "<C-W>k", { desc = "Go to top pane" })
vim.keymap.set("n", "<leader>ol", "<C-W>l", { desc = "Go to right pane" })

--[[Plugins]]
--ChadTree
vim.keymap.set("n", "<leader>v", "<cmd>CHADopen<cr>", { desc = "Files" })

--Telescope
vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>", { desc = "Telescope" })

--Notify
vim.keymap.set(
	"n",
	"<leader>n",
	"<cmd>lua require('telescope').extensions.notify.notify()<cr>",
	{ desc = "Notify", silent = true }
)
--Alpha
vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Home" })

--Code Runner
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
