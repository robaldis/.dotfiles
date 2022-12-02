local nnoremap = require('robert.keymap').nnoremap

nnoremap("<leader>g", "<cmd>Git<CR>");

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
