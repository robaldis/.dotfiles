local nnoremap = require ("robert.keymap").nnoremap
local inoremap = require ("robert.keymap").inoremap
local mason = require('mason')
local masonConfig = require('mason-lspconfig')
local cmp = require('cmp')


-- Mason setups
mason.setup()
masonConfig.setup({
    ensure_installed = {'sumneko_lua'}
})

-- completion setups
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        {name = 'nvim_lsp'}
    }, {
        {name = 'buffer'}
    }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Keymappings
local on_attach = function(client, bufnr)
    -- Enable completion
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    nnoremap("<leader>K", function() vim.lsp.buf.hover() end)
    nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
    nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end)
    nnoremap("<leader>gr", function() vim.lsp.buf.references() end)
    nnoremap("<leader>gD", function() vim.lsp.buf.declaration() end)
    nnoremap("<leader>gt", function() vim.lsp.buf.type_definition() end)
    nnoremap("<leader>e", function() vim.diagnostic.open_float() end)
end

-- Server Setup
masonConfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach=on_attach,
            capabilities=capabilities
        }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --[[
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {}
    end
    ]]--
}
-- Setup Csharp LSP
local pid = vim.fn.getpid()

local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

require('lspconfig').omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    -- Additional configuration can be added here
    on_attach=on_attach,
    capabilities=capabilities
})

require('inlay-hints').config()

--[[
local cmp = require("cmp")
local nnoremap = require ("robert.keymap").nnoremap
local inoremap = require ("robert.keymap").inoremap

require("nvim-lsp-installer").setup {}


cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      {name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})


local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})


local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end


require("lspconfig").pylsp.setup(config())
require("lspconfig").clangd.setup(config())
require("lspconfig").tsserver.setup(config())
require("lspconfig").sumneko_lua.setup(config())
]]--
