local snippets = require("snippets.tex")

local map = vim.keymap.set
local fn = vim.fn

local build_latex = "<CMD>TexlabBuild"
local open_pdf = "<CMD>!xdg-open " .. fn.expand("%:p:t:r") .. ".pdf"

map("n", "<localleader>c", function()
    return build_latex .. "<CR>"
end, { expr = true, desc = "Build LaTeX Document" })

map("n", "<localleader>o", function()
    return open_pdf .. " &<CR>"
end, { expr = true, desc = "Open Compiled LaTeX Document" })

-- The first command is too slow for the second, so the pdf file doesn't get
-- updated on time. Might retry this keymap later.
-- map("n", "<localleader>p", function()
--     return build_latex .. "<CR> ^V| " .. open_pdf .. " &<CR>"
-- end, { expr = true, desc = "Build Then Open Compiled LaTeX Document" })

map("n", "<localleader>b", "i\\textbf{bold}<ESC>Fb", { desc = "Insert Bold Text in Normal Mode" })
map("i", "<C-b>", "\\textbf{}<ESC>i", { desc = "Insert Bold Text in Insert Mode"})


map("n", "<localleader>i", "i\\textit{italic}<ESC>Fi", { desc = "Insert Italic Text in Normal Mode" })
map("i", "<C-i>", "\\textit{}<ESC>i", { desc = "Insert Italic Text in Insert Mode"})

map("n", "<localleader>e", "i\\emph{emphasis}<ESC>Fe", { desc = "Insert Emphasized Text in Normal Mode" })
map("i", "<C-e>", "\\emph{}<ESC>i", { desc = "Insert Emphasized Text in Insert Mode"})


map("n", "<localleader>u", "i\\underline{underline}<ESC>Fu", { desc = "Insert Underlined Text in Normal Mode" })
map("i", "<C-u>", "\\underline{}<ESC>i", { desc = "Insert Underlined Text in Insert Mode"})

map("n", "<localleader>lu", function()
    return "i" .. snippets.itemize() .. "<ESC>V3k=jA "
end, { expr = true, desc = "Insert Unordered List in Normal Mode"} )


map("n", "<localleader>lo", function()
    return "i" .. snippets.enumerate() .. "<ESC>V3k=jA "
end, { expr = true, desc = "Insert Unordered List in Normal Mode"} )

