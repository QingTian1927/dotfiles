return {
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      vim.g.adwaita_darker = false
      vim.g.adwaita_disable_cursorline = false
      vim.g.adwaita_transparent = false
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("vscode").setup({
        transparent = false,
      })
      require("vscode").load()
    end,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },
}
