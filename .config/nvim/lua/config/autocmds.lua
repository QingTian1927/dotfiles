local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  desc = "Yank Automatic Highlight",
  group = augroup("Yank Highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

