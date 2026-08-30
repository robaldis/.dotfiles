-- csharp_ls requires the .NET SDK (pacman: dotnet-sdk); csharp-ls itself is
-- installed by mason via `dotnet tool` into mason's own bin. No PATH changes needed.


return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()

        vim.api.nvim_create_autocmd('LspAttach', {
          desc = 'LSP actions',
          callback = function()
            local bufmap = function(mode, lhs, rhs, desc)
              local opts = {buffer = true, desc = desc}
              vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Displays hover information about the symbol under the cursor
            bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', '[K] Hover')
            bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', '[G]oto [D]efinition')
            bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', '[G]oto [D]ecleration')
            bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', '[G]oto [I]mplementation')
            -- TODO: Maybe add in the telescope references
            bufmap('n', 'sr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', '[S]earch [R]eference')
            bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', '[G]oto [R]eference')
            bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', '[C]ode [A]ctions')
            bufmap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', '[R]e[N]ame')
            bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
            bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
            bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
            bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
            bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
          end
        })
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()

        -- Apply cmp completion capabilities to every LSP server.
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Per-server overrides merge on top of the built-in lsp/<server>.lua.
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    format = {
                        enable = true,
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        }
                    }
                }
            }
        })

        -- Installed servers are enabled automatically via vim.lsp.enable()
        -- (mason-lspconfig `automatic_enable`, default true).
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "csharp_ls",
                "gopls",
                --"omnisharp"
            },
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
