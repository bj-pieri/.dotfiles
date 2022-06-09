local M = {}

M.general = {
  n = {
    ["<leader>gg"] = {"<cmd> Vista!! <CR>", "ﮒ   toggle sidebar vista with ctags"},
    ["<leader>gf"] = {"<cmd> Vista finder <CR>", "ﮒ   toggle vista ctags searcher"},
    ["<leader>gr"] = {"<cmd> Vista finder! <CR>", "ﮒ   toggle recursively ctags searcher"},
  }
}

-- vim move remap
vim.api.nvim_set_keymap('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true})

-- use ESC to turn off search highlighting
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd> :noh <CR>", {noremap = true, silent = true})

return M
