return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      require("lualine").setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch" },
            { "diff" },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn", "info", "hint" },

              diagnostics_color = {
                error = "DiagnosticError",
                warn = "DiagnosticWarn",
                info = "DiagnosticInfo"
              },

              symbols = {
                error = "",
                warn = "",
                info = "",
                hint = ""
              },

              colored = true,
              update_in_insert = false,
              always_visible = false
            },
          },

          lualine_c = {
            {
              "filename",
              file_status = true,
              newfile_status = true,
              path = 0,
              shorting_target = 40,

              symbols = {
                modified = "[+]",
                readonly = "[x]",
                unnamed = "[unnamed]",
                newfile = "[new]",
              },
            },
          },

          lualine_x = {
            { "filetype" },
            { "encoding" },
            {
              "fileformat",
              symbols = {
                unix = "", -- e712
                dos = "", -- e70f
                mac = "" -- e711
              },
            },
          },

          lualine_y = { "progress" },
          lualine_z = { "location" },
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = { "diff" },

          lualine_c = {
            {
              "filename",
              file_status = true,
              newfile_status = true,
              path = 1,
              shorting_target = 40,

              symbols = {
                modified = "[+]",
                readonly = "[x]",
                unnamed = "[---]",
                newfile = "[new]"
              },
            },
          },

          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },

        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,
              show_modified_status = true,

              hide_filename_extension = false,
              mode = 0,
              max_length = vim.o.columns * 2 / 3,

              filetype_names = {
                netrw = "Netrw",
                TelescopePrompt = "Telescope",
                dirbuf = "Dirbuf"
              },

              symbols = {
                modified = " ●",
                alternate_file = "#",
                directory = ""
              },
            },
          },

          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },

        winbar = {},
        inactive_winbar = {},
        extensions = { "neo-tree", "lazy", "trouble", "mason", "man" }
      })
    end,
  }
}
