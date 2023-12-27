---@type MappingsTable

local M = {}


M.disabled = {
  n = {
      ["<C-n>"] = "",
  }
}


M.general = {
  n = {
    ["<leader>gg"] = {"<cmd> Vista!! <CR>", "toggle sidebar vista with ctags"},
    ["<leader>gf"] = {"<cmd> Vista finder <CR>", "toggle vista ctags searcher"},
    ["<leader>gr"] = {"<cmd> Vista finder! <CR>", "toggle recursively ctags searcher"},

    -- Toggle LSP server
    ["<leader>L"] = {"<cmd> LspStop <CR>", "toggle LSP server off"},
    ["<leader>l"] = {"<cmd> LspStart <CR>", " toggle LSP server on"},

    --Gitsigns toggle blame line
    ["<leader>o"] = {"<cmd> Gitsigns toggle_current_line_blame<CR>", "toggle Git line Blame"},

    -- MarkdownPreview mappings
    ["<leader>md"] = {"<cmd> :MarkdownPreviewToggle<CR>"},
    ["<A-n>"] = {"<cmd> NvimTreeToggle <CR>", "Toggle nvimtree"},
  }
}

M.lsp = {
  n = {
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true})
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true})

-- use ESC to turn off search highlighting
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd> :noh <CR>", {noremap = true, silent = true})

return M
