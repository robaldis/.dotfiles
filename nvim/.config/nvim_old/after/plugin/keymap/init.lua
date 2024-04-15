local nnoremap = require ("robert.keymap").nnoremap
local vnoremap = require ("robert.keymap").vnoremap
local inoremap = require ("robert.keymap").inoremap


nnoremap("<leader>pv", "<cmd>Ex<enter>")

-- Window movement
nnoremap("<leader>h", "<cmd>wincmd h<CR>")
nnoremap("<leader>l", "<cmd>wincmd l<CR>")
nnoremap("<leader>k", "<cmd>wincmd k<CR>")
nnoremap("<leader>j", "<cmd>wincmd j<CR>")

-- Delete to null
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

inoremap("<C-c>", "<Esc>")

-- Sesionizer
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- Copy to clipboard
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>yy", "\"+y")
vnoremap("<leader>y", "\"+y")

vim.g.NERDTreeWinSize=100
vim.g.NERDTreeShowHidden=1
nnoremap("<C-n>", "<cmd>NERDTreeToggle<CR>")


vim.keymap.set("n", "<C-y>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-t>", "<cmd>cprev<CR>zz")
