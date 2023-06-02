require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},

    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },

    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,

    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      { 'branch', },
      { 'diff', },
 
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },

        symbols = {error = '', warn = '', info = '', hint = ''},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }
    },

    lualine_c = {
      { 'filename',
        file_status = true,
	newfile_status = true,
	path = 0,
        shorting_target = 40,

	symbols = {
	  modified = '[+]',
          readonly = '[x]',
	  unnamed = '[---]',
	  newfile = '[new]',
	}
      }
    },

    lualine_x = {
      { 'filetype' },
      { 'encoding' },

      {
	'fileformat',
	symbols = {
          unix = '', -- e712
          dos = '',  -- e70f
          mac = '',  -- e711
        }
      }
    },
 
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},

    lualine_c = {
      { 'filename',
        file_status = true,
	newfile_status = true,
	path = 1,
        shorting_target = 40,

	symbols = {
	  modified = '[+]',
          readonly = '[x]',
	  unnamed = '[---]',
	  newfile = '[new]',
	}
      }
    },

    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 0,
        max_length = vim.o.columns * 2 / 3,

        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

        symbols = {
          modified = ' ●',
          alternate_file = '#',
          directory =  '',
        },
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },

  winbar = {},
  inactive_winbar = {},

  extensions = {'neo-tree'}
}
