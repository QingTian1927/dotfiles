return {
  {
    "sontungexpt/stcursorword",
    event = "VeryLazy",

    config = function()
      require("stcursorword").setup({
        excluded = {
          filetypes = {
            "TelescopePrompt",
            "netrw"
          },

          buftypes = {
            "nofile",
            "terminal",
          },
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = "HiPhish/rainbow-delimiters.nvim",

    event = { "BufEnter" },

    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are
      -- reset every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup({ scope = { highlight = highlight } })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",

    cmd = "NoNeckPain",
    keys = {
      { "<leader>zz", "<CMD>NoNeckPain<CR>", desc = "NoNeckPain Center Buffer" }
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost" },
    opts = {},
  },

  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,

    keys = { "v", "<C-v>", "V", "gv" },
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },

  {
    "m4xshen/smartcolumn.nvim",
    event = "VeryLazy",
    opts = {}
  },
}
