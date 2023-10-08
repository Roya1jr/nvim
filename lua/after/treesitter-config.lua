require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "cpp", "python", "javascript", "go" },
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil
	}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.bqn = {
	install_info = {
		url = "https://github.com/shnarazk/tree-sitter-bqn", -- local path or git repo
		files = { "src/parser.c" },                        -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "main",                                   -- default branch in case of git repo if different from master
		generate_requires_npm = false,                     -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false,            -- if folder contains pre-generated src/parser.c
	},
	filetype = "bqn",                                    -- if filetype does not match the parser name
}
