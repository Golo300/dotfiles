require("dracula").setup({})
require("dracula").load()
require("transparent").setup()

require("smear_cursor").setup({
	cursor_color = "#d3cdc3",
})

require("nvim-surfers").setup({
	use_tmux = true,
})

vim.g.transparent_enabled = true
