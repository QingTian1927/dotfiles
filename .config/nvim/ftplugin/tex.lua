local snippets = require("snippets.tex")

local map = vim.keymap.set
local fn = vim.fn

local open_pdf = "<CMD>!xdg-open " .. fn.expand("%:t:r") .. ".pdf &<CR>"
local build_latex = "<CMD>TexlabBuild<CR>"

map("n", "<localleader>c", build_latex, { desc = "Build LaTeX Document" })
map("n", "<localleader>o", open_pdf, { desc = "Open Compiled LaTeX Document" })
map("n", "<localleader>p", build_latex .. open_pdf,
    { desc = "Build Then Open Compiled LaTeX Document" }
)

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

