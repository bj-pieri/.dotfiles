local map = require("core.utils").map

-- telescope
map("n", "<leader>fp", ":Telescope media_files <CR>")
map("n", "<leader>te", ":Telescope <CR>")

-- vista
map("n", "<leader>vv", ":Vista!! <CR>") -- toggle sidebar vista with ctags
map("n", "<leader>vf", ":Vista finder <CR>") -- toggle vista ctags searcher
map("n", "<leader>vr", ":Vista finder! <CR>") -- toggle recursively vista ctagas searcher


vim.api.nvim_set_keymap('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
