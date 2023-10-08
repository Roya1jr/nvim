local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()
require("lspconfig")["vtsls"].setup({
	on_attach = function(client, bufnr)
		require("twoslash-queries").attach(client, bufnr)
	end,
})
