-----------
-- MASON --
-----------

require("mason").setup()
require("mason-lspconfig").setup{
  ensure_installed = {
	"jedi_language_server",
	"marksman",
	--"bashls",
  },
  automatic_installation = true,
}

require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.marksman.setup{}
--require'lspconfig'.bashls.setup{}


local servers = { 
  "jedi_language_server", 
  "marksman", 
  --"bashls",
}
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup(require('coq').lsp_ensure_capabilities({}))
end

-------------
-- NULL-LS --
-------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		 diagnostics.codespell,
		 diagnostics.pylint,
		 diagnostics.shellcheck,
		 diagnostics.gitlint,
	},
})

-------------
-- TROUBLE --
-------------

require("trouble").setup {
  fold_open = "v",
  fold_closed = ">",
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = ""
  }
}
