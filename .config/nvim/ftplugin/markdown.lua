local map = vim.keymap.set

map("n", "<localleader>b", "i**bold**<ESC>Fb", { desc = "Insert Bold Text" })

map("n", "<localleader>i", "i*italic*<ESC>Fi", { desc = "Insert Italic Text" })

map("n", "<localleader>f", "i```<CR>Code<CR>```<ESC>0k", { desc = "Insert Fenced Code Block" })

map("n", "<localleader>r", "A<CR><CR>---<CR><CR><ESC>0", { desc = "Insert Horizontal Divider" })

map("n", "<localleader>1", "i# Heading<ESC>FH", { desc = "Insert Heading Level 1" })

map("n", "<localleader>2", "i## Heading<ESC>FH", { desc = "Insert Heading Level 2" })

map("n", "<localleader>3", "i### Heading<ESC>FH", { desc = "Insert Heading Level 3" })

map("n", "<localleader>4", "i#### Heading<ESC>FH", { desc = "Insert Heading Level 4" })

map("n", "<localleader>5", "i##### Heading<ESC>FH", { desc = "Insert Heading Level 5" })

map("n", "<localleader>6", "i###### Heading<ESC>FH", { desc = "Insert Heading Level 6" })
