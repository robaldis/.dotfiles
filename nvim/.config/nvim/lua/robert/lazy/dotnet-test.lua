return{
    "nvim-neotest/neotest",
    dependencies = {
      {
        "Issafalcon/neotest-dotnet",
        "nvim-neotest/nvim-nio",
      }
    },
    config = function ()
        require("neotest").setup({
          adapters = {
            require("neotest-dotnet")
          }
        })
        vim.keymap.set("n", "<leader>nt", require("neotest").summary.toggle, {desc = "[N]eo [T]est"})
        vim.keymap.set("n", "<leader>nw", require("neotest").output_panel.toggle, {desc = "[N]eo [W]indow"})
    end,
}
