return {
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",

    opts = {
      keys = {
          ["<"] = { escape = false, close = true, pair = "<>" },
      }
    },
  },

  {
    "nmac427/guess-indent.nvim",
    lazy = false,
    opts = {},
  },

  {
    "echasnovski/mini.completion",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  {
    "echasnovski/mini.trailspace",
    version = "*",
    event = { "BufReadPost", "InsertLeave" },

    config = function()
      require("mini.trailspace").setup()

      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Trim Whitespaces Before Saving File",
        pattern = "*",
        callback = function()
          MiniTrailspace.trim()
        end,
      })
    end,
  },

  {
    "echasnovski/mini.surround",
    version = "*",

    keys = {
      { "sa", mode = { "n", "v" }, desc = "Add surrounding" },
      { "sd", mode = "n", desc = "Delete surrounding" },
      { "sr", mode = "n", desc = "Replace surrounding" },
      { "sf", mode = "n", desc = "Find surrounding on the right" },
      { "sF", mode = "n", desc = "Find surrounding on the left" },
      { "sh", mode = "n", desc = "Highlight surrounding" },
      { "sn", mode = "n", desc = "Update MiniSurround n_lines" },
    },

    config = true,
  },

  {
    "echasnovski/mini.move",
    version = "*",

    keys = {
      { "<A-h>", mode = { "n", "v" }, desc = "Move line left" },
      { "<A-l>", mode = { "n", "v" }, desc = "Move line right" },
      { "<A-k>", mode = { "n", "v" }, desc = "Move line up" },
      { "<A-j>", mode = { "n", "v" }, desc = "Move line down" },
    },

    config = true,
  },

  {
    'echasnovski/mini.comment',
    version = '*',
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",

    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
      { "gcc", desc = "Toggle comment on current line" },
    },

    config = function()
      require("mini.comment").setup({
        options = {
          custom_commenstring = function()
            local ts_commentstring = require("ts_context_commentstring")
            return ts_commentstring.calculate_commentstring() or vim.bo.commentstring
          end,
        }
      })
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = { enable_autocmd = false },
  },

  {
    "elihunter173/dirbuf.nvim",
    cmd = "Dirbuf",
    keys = {
      { "<leader>d", "<CMD>Dirbuf<CR>", desc = "Open Dirbuf" },
    },

    config = function()
      require("dirbuf").setup({
        show_hidden = false,
        sort_order = "directories_first",
        write_cmd = "DirbufSync",
      })

      vim.keymap.set("n", "<leader>D", "<NOP>", { desc = "Disable Custom Netrw Keybinding" })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope Find Files" },
      { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope Live Grep" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Telescope Buffers" },
      { "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Telescope Help Tags" },
      { "<leader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Telescope Recent Files" },
      { "<leader>km", "<CMD>Telescope keymaps<CR>", desc = "Telescope Keymaps" },
      { "<leader>fm", "<CMD>Telescope marks<CR>", desc = "Telescope Marks" },
      { "<A-f>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Telescope Current Buffer" },
    },
  },

  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",

    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim"
    }
  },

  {
    "gukz/ftFT.nvim",
    keys = { "f", "t", "F", "T" },
    config = true,
  },

  {
    "sitiom/nvim-numbertoggle",
    event = "VeryLazy",
  },
}
