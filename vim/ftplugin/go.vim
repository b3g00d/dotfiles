setlocal noexpandtab 
setlocal tabstop=4 
setlocal shiftwidth=4
setlocal autoindent
let b:ale_linters = ['golangci-lint', 'gometalinter']
let g:ale_go_golangci_lint_options = '--disable gci'

"autoformat
let g:formatterpath = ['/home/begood/goex/bin/gofumpt']
let g:formatdef_gofumpt = '"gofumpt"'
let g:formatdef_gci = '"gci"'
let g:formatdef_goreturns = '"goreturns"'
let g:formatters_go = ['gci', 'gofumpt', 'goreturns']
let g:run_all_formatters_go = 1
