require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


--Use Alt+n as hotkeys to Toggle Nvimtree
map("n", "<A-n>", "<cmd> NvimTreeToggle <CR>", {noremap = true, silent = true})

-- use ESC to turn off search highlighting
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd> :noh <CR>", {noremap = true, silent = true})

-- Stay in indent mode
map("v", "<", "<gv", { noremap = true, silent = true})
map("v", ">", ">gv", { noremap = true, silent = true})


--Vista plugin
map("n", "<leader>gg", "<cmd> Vista!! <CR>", {noremap = true, silent = true})
map("n", "<leader>gf", "<cmd> Vista finder <CR>", {noremap = true, silent = true})
map("n", "<leader>gr", "<cmd> Vista finder! <CR>", {noremap = true, silent = true})


-- Toggle LSP server
map("n", "<leader>L", "<cmd> LspStop <CR>", {noremap = true, silent = true})
map("n", "<leader>l", "<cmd> LspStart <CR>", {noremap = true, silent = true})

--Gitsigns toggle blame line
map("n", "<leader>o", "<cmd> Gitsigns toggle_current_line_blame<CR>", {noremap = true, silent = true})

-- MarkdownPreview mappings
map("n", "<leader>md", "<cmd> MarkdownPreviewToggle<CR>", {noremap = true, silent = true})
