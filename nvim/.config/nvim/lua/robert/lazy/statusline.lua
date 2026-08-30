return 
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'nvim-web-devicons'.get_icons()

        require('lualine').setup()
    end
}
