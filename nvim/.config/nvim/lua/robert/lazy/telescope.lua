return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }
    },
    config = function()
        local builtin = require 'telescope.builtin'
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, {desc = "[S]earch [H]elp"})
        vim.keymap.set("n", "<leader>sm", builtin.man_pages, {desc = "[S]earch [M]an pages"})
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, {desc = "[S]earch [K]eymaps"})
        vim.keymap.set("n", "<leader>sf", builtin.find_files, {desc = "[S]earch [F]iles"})
        vim.keymap.set("n", "<leader>sw", builtin.live_grep, {desc = "[S]earch [W]ord"})
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})
        vim.keymap.set("n", "<leader>sr", builtin.resume, {desc = "[S]earch [R]esume"})
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {desc = "[S]earch [O]ld files"})
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, {desc = "[ ] Seach Open Buffers"})
        vim.keymap.set("n", "<leader>ss", builtin.builtin, {desc = "[S]erch [S]elect Builtin"})

        vim.keymap.set("n", "<leader>se", function()
                builtin.diagnostics({severity = vim.diagnostic.severity.ERROR})
            end, {desc = "[S]erch [S]elect Builtin"})

        vim.keymap.set('n', '<leader>sgb', builtin.git_branches, {desc = "[S]earch [G]it [B]ranches"})
        vim.keymap.set('n', '<leader>sgc', builtin.git_commits, {desc = "[S]earch [G]it [C]ommits"})

        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
          end, { desc = '[S]earch [N]eovim files' })

    end

  }
}
