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
--return {
--    "theprimeagen/harpoon",
--    branch = "harpoon2",
--    dependencies = { 'nvim-lua/plenary.nvim' },
--    config = function ()
--        local harpoon = require('harpoon')
--        harpoon:setup()
--
--        vim.keymap.set('n', '<leader>a', function()harpoon:list():add()end, {desc = "Harpoon [A]dd"})
--        vim.keymap.set('n', '<C-e>', function () harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "[H]arpoon [L]ist"})
--        vim.keymap.set('n', '<C-h>', function () harpoon:list():select(1) end, {desc = "[H]arpoon Select 1"})
--        vim.keymap.set('n', '<C-j>', function () harpoon:list():select(2) end, {desc = "[H]arpoon Select 2"})
--        vim.keymap.set('n', '<C-k>', function () harpoon:list():select(3) end, {desc = "[H]arpoon Select 3"})
--        vim.keymap.set('n', '<C-l>', function () harpoon:list():select(4) end, {desc = "[H]arpoon Select 4"})
--    end
--}
--
--
