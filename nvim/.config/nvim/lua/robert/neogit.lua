local neogit = require('neogit')
local nnoremap = require('robert.keymap').nnoremap

neogit.setup {}

nnoremap("<leader>g", function()
    neogit.open({kind="split_above"})
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
