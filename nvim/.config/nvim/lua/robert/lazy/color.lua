return {
 --{"catppuccin/nvim", init = function()
 --   	 vim.cmd.colorscheme "catppuccin-frappe"
 --    end
 --}
  {
    "folke/tokyonight.nvim",
    init = function()
            vim.cmd.colorscheme "tokyonight-storm"
    end,
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
