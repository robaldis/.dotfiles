local nnoremap = require('robert.keymap').nnoremap

nnoremap("<leader>g", "<cmd>Git<CR>");

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
nnoremap("<leader>gp", "<cmd>Git push<CR>");
nnoremap("<leader>gR", function()
    local revert = vim.fn.input("commit to revert: ")
    vim.cmd("Git revert" .. revert);
end);
nnoremap("<leader>gl", "<cmd>Git log<CR>");
nnoremap("<leader>gd", "<cmd>Gvdiffsplit<CR>")
