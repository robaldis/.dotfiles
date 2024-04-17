return {
 "folke/trouble.nvim",
 branch = 'dev',
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
 keys = {
        -- TODO: Better mnemonics for this
{
      "<leader>td",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[T]roubble [D]iagnostics",
    },
    {
      "<leader>tD",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[T]roubble Current File [D]iagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[T]rouble [S]ymbols",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "[T]roubble [L]sp",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Toggle [T]roubble [Q]uickfix list",
    },
    }
}
