setlocal noexpandtab 
setlocal tabstop=4 
setlocal shiftwidth=4
setlocal autoindent
let b:ale_linters = ['gometalinter', 'gopls']
let g:ale_go_golangci_lint_options = '--disable gci'

"autoformat
let g:formatterpath = ['/home/begood/goex/bin/gofumpt']

" https://github.com/mvdan/gofumpt/issues/2
let g:formatdef_gofumpt = '"GOFUMPT_SPLIT_LONG_LINES=on gofumpt -w "'
let g:formatdef_gci = '"gci"'
let g:formatdef_goreturns = '"goreturns"'
let g:formatdef_golines = '"golines -m 80"'
let g:formatters_go = ['gci', 'golines', 'gofumpt', 'goreturns']
let g:run_all_formatters_go = 1

"vim-go
noremap <leader>gdf :GoDef<CR>
noremap <leader>gdc :GoCallees<CR>
noremap <leader>gr :GoReferrers<CR>
noremap <leader>gi :GoImplements<CR>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1
let g:go_fmt_command = "golines"
let g:go_fmt_options = {
    \ 'golines': '-m 80',
    \ }

" Or, when you have Vim supporting virtual text
" cái này khiến cho golang cứ bị bật preview window
let g:ycm_echo_current_diagnostic = 1
