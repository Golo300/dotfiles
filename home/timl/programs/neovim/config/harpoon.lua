-- Install Harpoon using packer.nvim (add this to your plugins setup)
-- use 'ThePrimeagen/harpoon'

-- Load Harpoon modules
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Key mappings
vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
vim.keymap.set("n", "<leader>fh", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)

vim.keymap.set("n", "<C-s>", function() ui.nav_prev() end)
vim.keymap.set("n", "<C-n>", function() ui.nav_next() end)

