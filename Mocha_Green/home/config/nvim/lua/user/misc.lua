-- Setup Glow Markdown Preview --
require('glow').setup({
  style = "dark",
  border = "shadow",
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7,
  heigh_ratio = 0.7,
})

-- Autostart COQ --
vim.cmd([[COQnow -s]])

-- Catppuccin Theme --
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  term_colors = false,

  styles = {
    comments = { "italic" },
  },

  integrations = {
    alpha = true,
    mason = true,
    neotree = true,

    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },

    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },

      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})
vim.cmd.colorscheme "catppuccin"

-- Setup autoclose pairs --
require("autoclose").setup({})

-- Icons --
require'nvim-web-devicons'.setup {
  color_icons = true;
  default = true;
}

-- Highlight indentation levels --
require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
}

-- Highlight cursor words --
require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- Automatic relative line numbers --
require('numbers').setup {
  excluded_filetypes = { "alpha", }
}

-- Link visitor --
require("link-visitor").setup({
  open_cmd = nil,
  --[[ cmd to open url
    defaults:
    win or wsl: cmd.exe /c start
    mac: open
    linux: xdg-open
  --]]
  silent = true, -- disable all prints, `false` by defaults skip_confirmation
  skip_confirmation = false, -- Skip the confirmation step, default: false
  border = "rounded" -- none, single, double, rounded, solid, shadow see `:h nvim_open_win()`
})
