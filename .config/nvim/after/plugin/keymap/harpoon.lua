local nnoremap = require ("robert.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)

nnoremap("<C-g>", function() require("harpoon.mark").rm_file() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1)end, silent)
nnoremap("<C-j>", function() require("harpoon.ui").nav_file(2)end, silent)
nnoremap("<C-k>", function() require("harpoon.ui").nav_file(3)end, silent)
nnoremap("<C-l>", function() require("harpoon.ui").nav_file(4)end, silent)

nnoremap("<leader><C-r>", function() require("harpoon.mark").clear_all() end, silent)

nnoremap("<leader>tj", function() require("harpoon.term").gotoTerminal(1)end, silent)
nnoremap("<leader>tk", function() require("harpoon.term").gotoTerminal(2)end, silent)

