local map = vim.keymap.set

map("n", "<localleader>b", "i**bold**<ESC>Fb", { desc = "Insert Bold Text in Normal Mode" })
map("i", "<C-b>", "****<ESC>hi", { desc = "Insert Bold Text in Insert Mode" })

map("n", "<localleader>i", "i*italic*<ESC>Fi", { desc = "Insert Italic Text in Normal Mode" })
map("i", "<C-b>", "**<ESC>i", { desc = "Insert Italic Text in Insert Mode" })

map("n", "<localleader>f", "i```<CR>Code<CR>```<ESC>0k", { desc = "Insert Fenced Code Block" })
map("i", "<C-f>", "```<CR><CR>```j", { desc = "Insert Fenced Code Block" })

map("n", "<localleader>r", "A<CR><CR>---<CR><CR><ESC>0", { desc = "Insert Horizontal Divider" })

map("n", "<localleader>1", "i# Heading<ESC>FH", { desc = "Insert Heading Level 1 in Normal Mode" })
map("n", "<localleader>2", "i## Heading<ESC>FH", { desc = "Insert Heading Level 2 in Normal Mode" })
map("n", "<localleader>3", "i### Heading<ESC>FH", { desc = "Insert Heading Level 3 in Normal Mode" })
map("n", "<localleader>4", "i#### Heading<ESC>FH", { desc = "Insert Heading Level 4 in Normal Mode" })
map("n", "<localleader>5", "i##### Heading<ESC>FH", { desc = "Insert Heading Level 5 in Normal Mode" })
map("n", "<localleader>6", "i###### Heading<ESC>FH", { desc = "Insert Heading Level 6 in Normal Mode" })

