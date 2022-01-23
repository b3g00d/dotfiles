" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=croql
setlocal fileformat=unix
setlocal softtabstop=4
setlocal fileformat=unix
setlocal cindent
setlocal colorcolumn=80
setlocal textwidth=79

" function chay command:
nnoremap <silent> <F5> :w<CR>:!clear;python3 %<CR>
nnoremap <silent> <F6> :w<CR>:!clear;sage %<CR>
nnoremap <silent> <F4> :w<CR>:!clear;python2 %<CR>
" set foldmethod=indent
let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let b:ale_fixers = {'python': ['black', 'yapf']}
let b:ale_linters = ['flake8']
let g:ale_python_flake8_options = "--ignore=E203"
