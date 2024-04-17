return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy=false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {'<leader>sc', '<cmd>TodoTelescope<CR>', {desc = '[S]earch [C]omments'}},
    -- TODO: I don't like this keybinding, caps is hard
    {'<leader>tc', '<cmd>TodoTrouble<CR>', {desc = '[S]how [C]omments'}}

  }
}
