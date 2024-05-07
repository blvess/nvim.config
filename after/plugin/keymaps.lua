local map = vim.keymap.set

-- Navigation
map("t", "<C-h>", "<cmd>wincmd h<CR>", { silent = true, desc = "Move Left" })
map("t", "<C-j>", "<cmd>wincmd j<CR>", { silent = true, desc = "Move Down" })
map("t", "<C-k>", "<cmd>wincmd k<CR>", { silent = true, desc = "Move Up" })
map("t", "<C-l>", "<cmd>wincmd l<CR>", { silent = true, desc = "Move Right" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Lazy
map("n", "<leader>u", "<cmd>Lazy sync<cr>", { silent = true, desc = "Lazy Sync" })

-- Toggle
map("n", "<leader>w", "<cmd>set wrap!<cr>", { silent = true, desc = "Toggle Wrap" })
map("n", "<leader>l", "<cmd>set list!<cr>", { silent = true, desc = "Toggle Wrap" })

-- Clear Highlight
map("n", "<cr>", ":noh<cr><cr>", { silent = true, desc = "Clear Highlight" })

-- Block Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move Line Up" })

-- Zoom in the current window
map("n", "<leader>+", ":wincmd _<CR>", { noremap = true })

-- Zoom out the current window
map("n", "<leader>-", ":wincmd =<CR>", { noremap = true })
