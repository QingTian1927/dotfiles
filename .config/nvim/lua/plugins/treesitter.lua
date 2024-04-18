return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    event = { "BufReadPost", "BufNewFile" },

    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = false,

        ensure_installed = {
          "javascript",
          "json",
          "css",
          "html",
          "regex",
          "python",
          "lua",
          "c",
          "elixir",
          "java",
        },

        ignore_install = {},

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,

          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },

        indent = { enable = true, },
      })

      vim.cmd("set foldmethod=expr")
      vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
      vim.cmd("set nofoldenable")
    end,
  },
}
