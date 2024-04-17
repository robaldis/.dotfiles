Add_terminal = function ()
    vim.cmd("terminal")
    require('harpoon'):list("terminal"):append()
end

return
{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
       require("harpoon"):setup({})
    end,
    keys = {
        {"<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon [A]dd file"},
        {"<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Open Window"},
        {'<C-h>', function () require('harpoon'):list():select(1) end, {desc = "Harpoon Select 1"}},
        {'<C-j>', function () require('harpoon'):list():select(2) end, {desc = "Harpoon Select 2"}},
        {'<C-k>', function () require('harpoon'):list():select(3) end, {desc = "Harpoon Select 3"}},
        {'<C-l>', function () require('harpoon'):list():select(4) end, {desc = "Harpoon Select 4"}},

        {'<leader>tj', function ()  require('harpoon'):list("term"):select(1) end, {desc = "GoTo terminal 1"}},
        {'<leader>tk', function () require('harpoon'):list("term"):select(2) end, {desc = "GoTo terminal 2"}}
    }
}
