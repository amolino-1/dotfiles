return {
	"mechatroner/rainbow_csv",
	enabled = true,
	ft = { "csv" },
	-- set the filetype using vim command
	vim.cmd("autocmd BufNewFile,BufRead *.csv set filetype=rfc_csv"),
}
