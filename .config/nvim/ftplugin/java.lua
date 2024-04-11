vim.keymap.set("n", "<localleader>cc", function()
    vim.fn.system("javac " .. vim.fn.expand("%:p"))
    vim.print("Compiled " .. vim.fn.expand("%"))
end, { desc = "Compile Source File with Javac" })
