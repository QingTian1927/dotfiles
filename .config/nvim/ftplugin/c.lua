vim.keymap.set("n", "<localleader>cc", function()
  local os_type = vim.loop.os_uname().sysname
  local filename = vim.fn.expand('%:p:t:r')

  local srcfile = filename .. ".c"
  local binfile

  if (os_type == "Windows_NT")
  then
    binfile = filename .. ".exe"
  else
    binfile = filename .. ".bin"
  end

  vim.fn.system("gcc -Wall -o " .. binfile .. " " .. srcfile)
  vim.print("Compiled " .. binfile .. " from " .. srcfile)
end, { desc = "Compile Source File with GCC"})

