require("zen-mode").setup {
  window = {
    backdrop = 0.8,
    width = .70,
    height = 1,

    options = {
      number = false,
      cursorline = true,
      list = false,
      signcolumn = "no",
      foldcolumn = "0",
    },
  },

  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = true },
    kitty = {
      enabled = true,
      font = "+2",
      },
  },

  -- callback for custom Zen window code
  on_open = function(win)
  end,
  on_close = function ()
  end,
}

require("twilight").setup {
  dimming = {
    alpha = 0.2,
    color = { "Normal", "#e0def4" }, 
    term_bg = "#191724",
    inactive = false,
  },
  context = 20,
}

