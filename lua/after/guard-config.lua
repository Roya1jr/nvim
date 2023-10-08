local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
local ft = require("guard.filetype")

-- Assuming you have guard-collection
ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")

ft("go")
		:fmt({
			cmd = "goimports",
			stdin = true,
		})
		:append("gofmt")
		:lint({
			cmd = "staticcheck",
			stdin = true,
			fname = true,
		})

ft("uiua"):fmt({
	cmd = "uiua",
	args = { "fmt" },
	fname = true,
	stdin = true,
})

ft("bqn"):fmt("lsp")

-- Call setup() LAST!
require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
