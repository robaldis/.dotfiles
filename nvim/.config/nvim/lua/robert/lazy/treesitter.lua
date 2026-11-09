return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",

  cmd = { "TSInstall", "TSUpdate", "TSLog", "TSUninstall" },
  event = { "BufReadPre", "BufNewFile" },

  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "c_sharp",
      "zsh",
      "go",
      "sql",
      "nginx",
      "make",
      "gitignore",
      "gitcommit",
      "dockerfile",
      "diff",
      "csv",

    },
  },

  config = function(_, opts)
    local TS = require("nvim-treesitter")
    TS.setup()

    -- Install any missing parsers on first load
    local installed = require("nvim-treesitter.config").get_installed("parsers")
    local missing = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, opts.ensure_installed)

    if #missing > 0 then
      vim.schedule(function()
        TS.install(missing, { summary = true })
      end)
    end

    -- Enable native treesitter highlighting whenever a parser is available
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
