--Custom file types

--Uiua
vim.cmd "au! BufRead,BufNewFile *.ua setf uiua"
vim.cmd "au! BufRead,BufNewFile * if getline(1) =~ '^#!.*ua$' | setf uiua | endif"

--BQN
vim.cmd "au! BufRead,BufNewFile *.bqn setf bqn"
vim.cmd "au! BufRead,BufNewFile * if getline(1) =~ '^#!.*bqn$' | setf bqn | endif"