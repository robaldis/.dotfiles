vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<Cr>")

vim.keymap.set('v', '<leader>y', '\"+y', {desc ='[Y]ank to clipboard'})

vim.keymap.set('i', '<C-c>', '<Esc>', {desc = 'Ctrl-c same as ESC'})


vim.keymap.set('n', '<leader>h', '<C-w>h', {desc = '[h] move window up'})
vim.keymap.set('n', '<leader>j', '<C-w>j', {desc = '[j] move window up'})
vim.keymap.set('n', '<leader>k', '<C-w>k', {desc = '[k] move window up'})
vim.keymap.set('n', '<leader>l', '<C-w>l', {desc = '[l] move window up'})

vim.opt.hlsearch = true
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<C-c><C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-n>', '<cmd>cnext<CR>', {desc = "Quick fix list [N]ext"})
vim.keymap.set('n', '<C-p>', '<cmd>cnext<CR>', {desc = "Quick fix list [P]evious"})
