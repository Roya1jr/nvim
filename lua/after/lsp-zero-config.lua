local lsp_zero = require("lsp-zero")
local lsp = lsp_zero.preset({})
lsp_zero.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.buffer_autoformat()
end)

-- Completion
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- `Tab and <Shift Tab>` to cycle through completion
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
})

local lspconf = require("lspconfig")
-- lua
lspconf.lua_ls.setup(lsp.nvim_lua_ls())

--Manual lsp
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

--Uiua
if not configs.uiualsp then
	configs.uiualsp = {
		default_config = {
			cmd = { "uiua", "lsp" },
			filetypes = { "ua" },
			autostart = true,
			root_dir = require("lspconfig.util").root_pattern("main.ua"),
		},
		docs = {
			description = [[
      Uiua Language Server
  ]],
			default_config = {
				root_dir = [[util.find_git_ancestor]],
			},
		},
	}
end
lspconf.uiualsp.setup({})

--BQN
if not configs.bqnlsp then
	configs.bqnlsp = {
		default_config = {
			cmd = { "bqnlsp" },
			cmd_env = {},
			filetypes = { "bqn" },
			root_dir = require("lspconfig.util").root_pattern("main.bqn"),
		},
		docs = {
			description = [[
      BQN Language Server
  ]],
			default_config = {
				root_dir = [[util.find_git_ancestor]],
			},
		},
	}
end
lspconf.bqnlsp.setup({})

-- C\CPP
if not configs.clangd then
	configs.clangd = {
		default_config = {
			cmd = { "clangd" },
			cmd_env = {},
			filetypes = { "cpp", "c" },
			root_dir = util.find_git_ancestor,
			single_file_support = false,
			autostart = true,
		},
		docs = {
			description = [[
      C/C++ Language Server
  ]],
			default_config = {
				root_dir = [[util.find_git_ancestor]],
			},
		},
	}
end
lspconf.clangd.setup({})

lsp.setup()
