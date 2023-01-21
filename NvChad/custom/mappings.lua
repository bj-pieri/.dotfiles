local M = {}

M.general = {
  n = {
    ["<leader>gg"] = {"<cmd> Vista!! <CR>", "ﮒ   toggle sidebar vista with ctags"},
    ["<leader>gf"] = {"<cmd> Vista finder <CR>", "ﮒ   toggle vista ctags searcher"},
    ["<leader>gr"] = {"<cmd> Vista finder! <CR>", "ﮒ   toggle recursively ctags searcher"},

    -- Toggle LSP server
    ["<leader>L"] = {"<cmd> LspStop <CR>", "ﮒ   toggle LSP server off"},
    ["<leader>l"] = {"<cmd> LspStart <CR>", "ﮒ   toggle LSP server on"},

    --Gitsigns toggle blame line
    ["<leader>o"] = {"<cmd> Gitsigns toggle_current_line_blame<CR>", "ﮒ   toggle Git line Blame"},

    -- MarkdownPreview mappings
    ["<leader>md"] = {"<cmd> :MarkdownPreviewToggle<CR>"},
  }
}

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true})

-- use ESC to turn off search highlighting
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd> :noh <CR>", {noremap = true, silent = true})

return M
