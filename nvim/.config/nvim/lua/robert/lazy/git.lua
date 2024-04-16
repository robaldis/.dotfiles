return {
    {
    "tpope/vim-fugitive",
    dependencies = {
        'lewis6991/gitsigns.nvim'
    },
    config = function ()
        require('gitsigns').setup({
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = 'd' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
              },
            })
        vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[G]it [B]lame'})
        vim.keymap.set('n', '<leader>g', '<cmd>Git<CR>', {desc = '[G]it'})
    end
    }
}
