-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically reloads neovim whenever plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  -- My plugins here
  -- Plenary Dependency
  use "nvim-lua/plenary.nvim"

  -- Ricing
  use { "catppuccin/nvim", as = "catppuccin" }
  use "nvim-tree/nvim-web-devicons"

  -- Utilities
  use "lukas-reineke/indent-blankline.nvim"
  use "folke/zen-mode.nvim"
  use "folke/twilight.nvim"
  use "m4xshen/autoclose.nvim"
  use "ellisonleao/glow.nvim"
  use "yamatsum/nvim-cursorline"
  use "nkakouros-original/numbers.nvim"
  use "xiyaowong/link-visitor.nvim"

  -- LSP Related
  use "folke/lsp-colors.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", }

  -- COQ Autocompletion
  use { "ms-jpq/coq_nvim", branch = "coq", }
  use { "ms-jpq/coq.artifacts", branch = "artifacts", }

  -- Alpha Nvim Startup
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
 
  -- Lualine Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
 
  -- Mason LSP Manager & LSP Config
  use { 
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Neo-tree File Manager
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
