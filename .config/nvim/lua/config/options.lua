local opt = vim.opt

opt.termguicolors = true  -- True color support
opt.mouse = "a"  -- Enable mouse for all modes

opt.list = true  -- Show some invisible characters
opt.listchars = { tab = "🡢 |", trail = "~" }
--opt.listchars:append "eol:↴"
--opt.listchars:append "space:·"

opt.number = true  -- Print line number
opt.cursorline = true  -- Enable highlighting of the current line
opt.cursorcolumn = false  -- Enable highlighting of the current column

opt.autoindent = true
opt.smartindent = true  -- Insert indents automatically

opt.ignorecase = true  -- Toggle case-insensitive search
opt.smartcase = true  -- Don't ignore case with capitals

opt.splitbelow = true  -- Put new windows below current
opt.splitright = true  -- Put new windows right of current
opt.splitkeep = "screen"  -- Keep the text on the same screen line

opt.expandtab = true  -- Use spaces instead of tabs
opt.shiftround = true  -- Round indent
opt.shiftwidth = 4  -- Size of an indent
opt.tabstop = 4  -- Number of spaces tabs count for

opt.pumheight = 20  -- Maximum number of entries in a popup
opt.scrolloff = 4  -- Lines of context

opt.spelllang = { "en" }  -- Spell checking is not enabled by default

vim.g["netrw.keepdir"] = 0  -- Keep the current directory and the browsing directory synced
vim.g["netrw_banner"] = 0  -- Hide banner by default
vim.g["netrw_winsize"] = 30  -- Set the size of the Netrw split
vim.g["netrw_list_hide"] = [[\(^\|\s\s\)\zs\.\S\+]]  -- Hide dotfiles by default
vim.g["netrw_localcopydircmd"] = "cp -r"  -- Copy directories recursively

