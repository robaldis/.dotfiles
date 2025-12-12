-- For csharp_ls
-- `dotnet tool install --global csharp-ls`
-- add that to the path


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
            bufmap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', '[C]ode [A]ctions')
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
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "csharp_ls",
                --"omnisharp"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
                --["omnisharp"] = function()
                --    -- Keymappings
                --    local on_attach = function(client, bufnr)
                --        -- Enable completion
                --        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                --    
                --        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = '[K] Hover'})
                --        vim.keymap.set('n', "<leader>gd", function() vim.lsp.buf.definition() end)
                --        vim.keymap.set('n', "<leader>gi", function() vim.lsp.buf.implementation() end)
                --        vim.keymap.set('n', "<leader>gr", function() require("telescope.builtin").lsp_references() end)
                --        vim.keymap.set('n', "<leader>gD", function() vim.lsp.buf.declaration() end)
                --        vim.keymap.set('n', "<leader>gt", function() vim.lsp.buf.type_definition() end)
                --        vim.keymap.set('n', "<leader>e", function() vim.diagnostic.open_float() end)
                --        vim.keymap.set('n', "<leader>rn", function() vim.lsp.buf.rename() end)
                --        vim.keymap.set('n', "<leader>ca", function() vim.lsp.buf.code_action() end)
                --        ih.on_attach(client, bufnr)
                --    
                --    end
                --    local pid = vim.fn.getpid()
                --    
                --    local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
                --    local lspconfig = require("lspconfig")
                --        require('lspconfig').omnisharp.setup({
                --            cmd = { omnisharp_bin,
                --            "--languageserver",
                --            "RoslynExtensionsOptions:EnableDecompilationSupport=true",
                --            "RoslynExtensionsOptions:EnableAnalyzersSupport=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:EnableForParameters=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForLiteralParameters=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForIndexerParameters=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForObjectCreationParameters=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForOtherParameters=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatDifferOnlyBySuffix=false",
                --            "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatMatchMethodIntent=false",
                --            "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatMatchArgumentName=false",
                --            "RoslynExtensionsOptions:InlayHintsOptions:EnableForTypes=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForImplicitVariableTypes=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForLambdaParameterTypes=true",
                --            "RoslynExtensionsOptions:InlayHintsOptions:ForImplicitObjectCreation=true",
                --            "--hostPID", tostring(pid) },
                --            -- Additional configuration can be added here
                --            on_attach = on_attach,
                --            capabilities = capabilities
                --        })
                --    
                --end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    }
                                },
                            }
                        }
                    }
                end,
            }
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

--local nnoremap = require("robert.keymap").nnoremap
--local inoremap = require("robert.keymap").inoremap
--local mason = require('mason')
--local masonConfig = require('mason-lspconfig')
--local cmp = require('cmp')
--
--require("inlay-hints").setup()
--local ih = require("inlay-hints")
--
---- Mason setups
--mason.setup()
--masonConfig.setup({
--    ensure_installed = { 'lua_ls', 'bashls', 'pyright' }
--})
--
---- completion setups
--cmp.setup({
--    snippet = {
--        expand = function(args)
--            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--        end
--    },
--    mapping = cmp.mapping.preset.insert({
--        ['<C-Space>'] = cmp.mapping.complete(),
--        ['<tab>'] = cmp.mapping.select_next_item(),
--        ['<C-e>'] = cmp.mapping.abort(),
--        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--    }),
--    sources = {
--        { name = 'nvim_lsp' }
--    }, {
--        { name = 'buffer' }
--    }
--})
--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
---- Keymappings
--local on_attach = function(client, bufnr)
--    -- Enable completion
--    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = '[K] Hover'})
--    --nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
--    --nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end)
--    --nnoremap("<leader>gr", function() require("telescope.builtin").lsp_references() end)
--    --nnoremap("<leader>gD", function() vim.lsp.buf.declaration() end)
--    --nnoremap("<leader>gt", function() vim.lsp.buf.type_definition() end)
--    --nnoremap("<leader>e", function() vim.diagnostic.open_float() end)
--    --nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
--    --nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
--    ih.on_attach(client, bufnr)
--
--end
--
---- Server Setup
--masonConfig.setup_handlers {
--    -- The first entry (without a key) will be the default handler
--    -- and will be called for each installed server that doesn't have
--    -- a dedicated handler.
--    function(server_name) -- default handler (optional)
--        require("lspconfig")[server_name].setup {
--            on_attach = on_attach,
--            capabilities = capabilities
--        }
--    end,
--    -- Next, you can provide a dedicated handler for specific servers.
--    -- For example, a handler override for the `rust_analyzer`:
--    --[[
--    ["rust_analyzer"] = function ()
--        require("rust-tools").setup {}
--    end
--    ]] --
--}
---- Setup Csharp LSP
--
--
--local pid = vim.fn.getpid()
--
--local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
--
--vim.lsp.set_log_level('debug')
--
--require('lspconfig').omnisharp.setup({
--    cmd = { omnisharp_bin,
--    "--languageserver",
--    "RoslynExtensionsOptions:EnableDecompilationSupport=true",
--    "RoslynExtensionsOptions:EnableAnalyzersSupport=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:EnableForParameters=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForLiteralParameters=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForIndexerParameters=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForObjectCreationParameters=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForOtherParameters=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatDifferOnlyBySuffix=false",
--    "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatMatchMethodIntent=false",
--    "RoslynExtensionsOptions:InlayHintsOptions:SuppressForParametersThatMatchArgumentName=false",
--    "RoslynExtensionsOptions:InlayHintsOptions:EnableForTypes=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForImplicitVariableTypes=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForLambdaParameterTypes=true",
--    "RoslynExtensionsOptions:InlayHintsOptions:ForImplicitObjectCreation=true",
--    "--hostPID", tostring(pid) },
--    -- Additional configuration can be added here
--    on_attach = on_attach,
--    capabilities = capabilities
--})
