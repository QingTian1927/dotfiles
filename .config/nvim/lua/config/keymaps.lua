local map = vim.keymap.set
local api = vim.api

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

----------------------- NEOVIM KEYMAPPING ------------------------

map("n", "<leader>q", "<CMD>bd!<CR>", { desc = "Discard Current Buffer" })

map("n", "<A-;>", "<CMD>terminal<CR>", { desc = "Open Terminal Buffer" })

-- Netrw file explorer
map("n", "<leader>d", "<CMD>Explore %:p:h<CR>", { desc = "Netrw (Buffer Directory)" })
map("n", "<leader>D", "<CMD>Explore<CR>", { desc = "Netrw (cwd)" })

-- Buffer navigation
map("n", "<Tab>", "<CMD>bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<CMD>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<leader><Tab>", "<CMD>e #<CR>", { desc = "Alternate Buffer" })

-- Creating % closing splits
map("n", "<leader>ss", "<CMD>split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>vs", "<CMD>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>sc", "<CMD>close<CR>", { desc = "Close Split" })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })

-- Resize window with <CTRL> + Arrow Keys
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease Window Width" })

-- Clear search highlights
map({ "i", "n" }, "<ESC>", "<CMD>noh<CR><ESC>", { desc = "Clear Search Highlights" })

-- Toggle built-in spell checker
map("n", "<leader>sp", function()
  vim.opt.spell = not(vim.opt.spell:get())
end, { desc = "Toggle Spell Checking" })

-- Autocompletion Keymaps --

-- <Tab> and <S-Tab> completion navigation in insert mode
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
  { expr = true, desc = "Next Completion Item" }
)

map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
  { expr = true, desc = "Previous Completion Item" }
)

-- Consistent <CR> (Carriage Return) behavior
local keys = {
  ["cr"]        = api.nvim_replace_termcodes("<CR>", true, true, true),
  ["ctrl-y"]    = api.nvim_replace_termcodes("<C-y>", true, true, true),
  ["ctrl-y_cr"] = api.nvim_replace_termcodes("<C-y><CR>", true, true, true),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()["selected"] ~= -1
    return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    return keys["cr"]
  end
end

map("i", "<CR>", "v:lua._G.cr_action()", { expr = true })

-- LSP Keymaps --

-- Global LSP keybindings
map("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP Previous Diagnostic" })
map("n", "d]", vim.diagnostic.goto_next, { desc = "LSP Next Diagnostic" })

-- Create LSP keybindings only when there is a LSP server attached
api.nvim_create_autocmd("LspAttach", {
  group = api.nvim_create_augroup("UserLspConfig", {}),

  callback = function(ev)
    -- Buffer local mapping

    map("n", "gD", vim.lsp.buf.declaration, {
      buffer = ev.buf, desc = "LSP Go to Declaration"
    })

    map("n", "gd", vim.lsp.buf.definition, {
      buffer = ev.buf, desc = "LSP Go to Definition"
    })

    map("n", "gi", vim.lsp.buf.implementation, {
      buffer = ev.buf, desc = "LSP Go to Implementation"
    })

    map("n", "K", vim.lsp.buf.hover, {
      buffer = ev.buf, desc = "LSP Display Hover Information"
    })

    -- -- Automatically show LSP hover information
    -- api.nvim_create_autocmd("CursorHold", {
    --   desc = "LSP Display Hover Automatically",
    --   callback = function()
    --     vim.lsp.buf.hover()
    --   end,
    -- })

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
      buffer = ev.buf, desc = "LSP Code Actions"
    })

    map("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "LSP Code Format" })
  end,
})

