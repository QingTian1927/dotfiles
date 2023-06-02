-----------------------
-- PLUGIN KEYMAPPING --
-----------------------

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>vv", "<cmd>Neotree toggle<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>pp", "<cmd>Glow<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<leader>ll", "<cmd>VisitLinkInBuffer<cr>",
  {silent = true, noremap = true}
)


-----------------------
-- NEOVIM KEYMAPPING --
-----------------------

-- Discard changes & close current buffer
vim.keymap.set("n", "<leader>bb", "<cmd>bd!<cr>",
  {silent = true, noremap = true}
)

-- Split & navigation
vim.keymap.set("n", "<leader>ss", "<cmd>split<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "<C-h>", "<C-w>h",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<C-j>", "<C-w>j",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<C-k>", "<C-w>k",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<C-l>", "<C-w>l",
  {silent = true, noremap = true}
)
