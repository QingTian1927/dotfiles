require("neo-tree").setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },

  source_selector = {
    winbar = true,
    statusline = false,

    sources = {
      { source = "filesystem", display_name = " File" },
      { source = "buffers", display_name = " Buff" },
      { source = "git_status", display_name = " Git" },
      { source = "diagnostics", display_name = " Diag" },
    },

    content_layout = "start",
    tabs_layout = "equal",
    truncation_character = "...",

    highlight_tab = "NeoTreeTabInactive",
    highlight_tab_active = "NeoTreeTabActive",
    highlight_background = "NeoTreeTabInactive",
    highlight_separator = "NeoTreeTabSeparatorInactive",
    highlight_separator_active = "NeoTreeTabSeparatorActive",
  },

  renderers = {
    directory = {
      { "indent" },
      { "icon" },
      { "current_filter" },
      {
        "container",
        content = {
          { "name", zindex = 10 },
          -- {
          --   "symlink_target",
          --   zindex = 10,
          --   highlight = "NeoTreeSymbolicLinkTarget",
          -- },
          { "clipboard", zindex = 10 },
          { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
          { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
        },
      },
    },
    file = {
      { "indent" },
      { "icon" },
      {
        "container",
        content = {
          {
            "name",
            zindex = 10
          },
          -- {
          --   "symlink_target",
          --   zindex = 10,
          --   highlight = "NeoTreeSymbolicLinkTarget",
          -- },
          { "clipboard", zindex = 10 },
          { "bufnr", zindex = 10 },
          { "modified", zindex = 20, align = "right" },
          { "diagnostics",  zindex = 20, align = "right" },
          { "git_status", zindex = 20, align = "right" },
        },
      },
    },
    message = {
      { "indent", with_markers = false },
      { "name", highlight = "NeoTreeMessage" },
    },
    terminal = {
      { "indent" },
      { "icon" },
      { "name" },
      { "bufnr" }
    }
  },

  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false,
  sort_function = nil,
  
  default_component_configs = {
    container = {
	enable_character_fade = true,
      	right_padding = 0,
    },
    indent = {
        indent_size = 2,
        padding = 1,
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
    },
    icon = {
     	folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
	default = "*",
        highlight = "NeoTreeFileIcon"
    },
    modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
    },
    name = {
   	trailing_slash = false,
	use_git_status_colors = true,
        highlight = "NeoTreeFileName",
    },
    diagnostics = {
        symbols = {
            hint = "",
            info = "",
            warn = "",
            error = "",
        },
        highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
        },
    },
    git_status = {
    	symbols = {
      	    -- Change type
      	    added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
      	    deleted   = "✖",
      	    modified  = "",
            renamed   = "",
      	    -- Status type
      	    untracked = "",
      	    ignored   = "",
      	    unstaged  = "",
      	    staged    = "",
      	    conflict  = "",
    	},
    	align = "right",
    },
  },
  window = {
    position = "left",
    width = 25,
    auto_expand_width = true,
    mapping_options = {
	noremap = true,
	nowait = true,
    },
    mapping = {
	["<space>"] = {
	    "toggle_node",
	    nowait = false,
	},
	["P"] = { "toggle_preview", config = { use_float = true } },
	["R"] = "refresh",
	["q"] = "close_window",
	["r"] = "rename",
	["d"] = "delete",
	["A"] = "add_directory",
	["a"] = {
	    "add",
	    config = {
		show_path = "none"
	    }
	},
    },
  },

  filesystem = {
    filtered_items = {
    	visible = false,
    	--hide_dotfiles = false,
    	--hide_gitignored = false,
    },
    window = {
	mappings = {
	    ["H"] = "toggle_hidden",
	    ["/"] = "fuzzy_finder",
	    ["D"] = "fuzzy_finder_directory",
	    ["<bs>"] = "navigate_up",
	}
    },
  },
})
