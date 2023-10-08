-- Setup
local home_dir = os.getenv("HOME")

-- Plugins
require("lazy").setup({
	--[[Visual]]
	--
	{
		"nvim-tree/nvim-web-devicons",
	},
	--Theme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			require("gruvbox").setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					comments = true,
					operators = true,
					folds = true,
				},
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	--Start Screen
	{
		"goolord/alpha-nvim",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("alpha-config")
		end,
	},
	--Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "gruvbox",
				component_separators = "|",
				section_separators = "",
			},
		},
	},
	--Icons
	{ "akinsho/bufferline.nvim",     version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

	--Better Comments
	{ "Djancyp/better-comments.nvim" },

	--Better Visuals
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	--[[ Functional ]]
	--
	{
		"folke/which-key.nvim",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			vim.opt.timeout = true
			vim.opt.timeoutlen = 300
			require("whichkey-config")
		end,
	},
	--Fizy Finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("telescope-config")
		end,

	},
	-- File Explorer
	{
		"ms-jpq/chadtree",
		branch = "chad",
		build = "python3 -m chadtree deps",
	},
	--Tabs
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim',  -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("treesitter-config")
		end,
		build = ":TSUpdate",
	},
	--Notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("notify-config")
		end,
	},

	--LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("lsp-zero-config")
		end,
		dependencies = {
			-- LSP manager
			{
				"williamboman/mason.nvim",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
					require("mason-config")
				end,
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				config = function()
					package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
					require("mason-ti-config")
				end
			},
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	},

	--Linting
	{
		"nvimdev/guard.nvim",
		-- Builtin configuration, optional
		dependencies = {
			"nvimdev/guard-collection",
			config = function()
				package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
				require("guard-config")
			end,
		},
	},

	--Autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel", "bqn", "uiua" },
			})
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("autopairs-config")
		end,
	},
	--Code Runner
	{
		"CRAG666/code_runner.nvim",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("coderunner-config")
		end,
	},
	--Terminal
	{
		"CRAG666/betterTerm.nvim",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("betterterm-config")
		end,
	},
	--Languages without LSP

	--BQN
	{
		"mlochbaum/BQN",
		config = function()
			vim.cmd("let g:nvim_bqn = 'bqn'")
			local lazypath = vim.fn.stdpath("data") .. "/lazy/BQN"
			vim.opt.rtp:append(lazypath .. "/editors/vim")
		end,
	},
	{
		"https://git.sr.ht/~detegr/nvim-bqn",
	},

	--- Language Plugins
	{
		"marilari88/twoslash-queries.nvim",
		config = function()
			package.path = home_dir .. "/.config/nvim/lua/after/?.lua;" .. package.path
			require("twoslash-config")
		end,
	},
})
