setlocal noexpandtab 
setlocal tabstop=4 
setlocal shiftwidth=4
setlocal autoindent

let g:prettier#exec_cmd_path = '/home/begood/.vim/plugged/vim-prettier/node_modules/.bin/prettier'
noremap <F8> :PrettierAsync<CR>

let b:ale_linters = ['solc', 'solium']
let g:ale_solidity_solc_options = '--allow-paths'
