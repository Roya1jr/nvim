require('code_runner').setup({
	-- put here the commands by filetype
	filetype = {
		bqn = "bqn $fileName",
		go = "go run $fileName",
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt"
		},
		javascript = "node $fileName",
		python = "python3 -u",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt"
		},
		typescript = { "tsc",
			"node $fileName"
		},
	},
})
