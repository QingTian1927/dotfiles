local snippets = require("snippets.c")

local map = vim.keymap.set
local fn = vim.fn

map("n", "<localleader>cc", function()
  local os_type = vim.loop.os_uname().sysname
  local filename = fn.expand('%:p:t:r')

  local srcfile = filename .. ".c"
  local binfile

  if (os_type == "Windows_NT")
  then
    binfile = filename .. ".exe"
  else
    binfile = filename .. ".bin"
  end

  fn.system("gcc -Wall -o " .. binfile .. " " .. srcfile)
  vim.print("Compiled " .. binfile .. " from " .. srcfile)
end, { desc = "Compile Source File with GCC"})

map("n", "<localleader>m", "i" .. snippets.main_common() .. "<ESC>V4k=2jo",
  { desc = "Common Main Template: Normal" }
)

map("n", "<localleader>f", "i" .. snippets.for_loop() .. "<ESC>V2k=fncw",
  { desc = "For Loop Snippet: Normal Mode" }
)
map("i", "<C-f>", snippets.for_loop() .. "<ESC>V2k=fncw",
  { desc = "For Loop Snippet: Insert Mode" }
)

map("n", "<localleader>s", "i" .. snippets.switch_case() .. "<ESC>V5k=0fecw",
  { desc = "For Loop Snippet: Normal Mode" }
)
map("i", "<C-s>", snippets.switch_case() .. "<ESC>V5k=0fecw",
  { desc = "For Loop Snippet: Insert Mode" }
)

