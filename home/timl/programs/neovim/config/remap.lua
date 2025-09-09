vim.keymap.set("n", "<leader>+", ":resize +3<cr>", { desc = "grow current split" })
vim.keymap.set("n", "<leader>-", ":resize -3<cr>", { desc = "shrink current split" })
vim.keymap.set("", "<leader>y", '"+y', { desc = "copy to clipboard" })
vim.keymap.set("", "<leader>p", '"+p', { desc = "paste from clipboard" })
vim.keymap.set("", "<leader>P", '"+P', { desc = "paste from clipboard" })
vim.keymap.set("", "<leader>v", ":vsplit <cr>", { desc = "split vertical" })
vim.keymap.set("", "<leader>s", ":w! <cr>", { desc = "save file" })
vim.keymap.set("", "<leader>c", ":split <cr>", { desc = "split horizontal" })
vim.keymap.set("", "<leader>e", ":Neotree dir=./ <cr>  :Neotree toggle <cr>", { desc = "open explorer" })
vim.keymap.set("", "<leader>q", ":quit <cr>", { desc = "close tab" })

vim.keymap.set("", "<leader>h", "<C-w>h", { desc = "switch to left" })
vim.keymap.set("", "<leader>j", "<C-w>j i", { desc = "switch down" })
vim.keymap.set("", "<leader>k", "<C-w>k", { desc = "switch up" })
vim.keymap.set("", "<leader>l", "<C-w>l", { desc = "switch to right" })
vim.keymap.set(
	"n",
	"<CR>",
	'{ -> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>" }()',
	{ expr = true, desc = "reset search highlight" }
)
-- exit terminal mode with escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode with escape" })
-- open new terminal on the bottom
vim.keymap.set("", "<leader>t", ":split term://zsh<cr>:resize -16<cr> :startinsert<cr>", { desc = "open terminal" })
