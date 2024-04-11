return {
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspStart", "LspStop", "LspRestart" },
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },

    config = function()
      require("neodev").setup()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",

    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",

    cmd = { "LspInstall", "LspUninstall" },
    opts = {},
  },

  {
    "mfussenegger/nvim-lint",
    events = { "BufReadPre", "BufNewFile" },

    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        java = { "checkstyle" },
        python = { "ruff" },
        gitcommit = { "gitlint" },
        markdown = { "proselint" },
        text = { "proselint" },
        tex = { "proselint" },
        sh = { "shellcheck" },
      }

      -- for ft, _ in pairs(lint.linters_by_ft) do
      --   table.insert(lint.linters_by_ft[ft], "codespell")
      -- end

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    cmd = "TroubleToggle",
    keys = {
      { "<leader>t", "<CMD>TroubleToggle<CR>", desc = "Toggle Trouble Diagnostics" },
    },

    opts = {
      fold_open = "v",
      fold_closed = ">",

      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
    },
  },

  {
    "zeioth/garbage-day.nvim",
    dependencies = { "neovim/nvim-lspconfig" },

    event = "LspAttach",
    opts = {},
  },

  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",

    config = function()
      require("inc_rename").setup({})

      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true, desc = "LSP Incremental Rename" })
    end,
  },
}
