" Required:
set runtimepath+=~/.nvim/

" Required:
call plug#begin('~/.nvim/bundle/')
Plug 'jgdavey/tslime.vim', { 'for': 'lisp' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-go', { 'build': 'make', 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' , 'for': 'go'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html'}
Plug 'alvan/vim-closetag', { 'for': 'html'}
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'chase/vim-ansible-yaml', { 'for': ['yaml', 'yml'] }
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'js' }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'romainl/flattened'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': ['markdown', 'html']}
Plug 'iamcco/markdown-preview.vim', { 'for': ['markdown', 'html', 'rst']}
Plug 'heavenshell/vim-pydocstring', { 'for': 'python' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Note: You don't set neobundle setting in .gvimrc!

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Tern
"let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'

set completeopt-=preview

" NeoMake
autocmd! BufEnter,BufWritePost * Neomake
"let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {'args': ['--ignore=D202,D100,D102,D103,D205,D400,D405,E226,E303,F403,H301,H304,H306,H405,N806,N802,N803,S001,F405,W503']}
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_place_signs_immediately = 1
let g:neomake_python_enabled_makers = ['flake8']
" vim-devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"
"
"
"
"
"
"
"
"
"
"
"
"
"SET: set code
set splitright
set splitbelow
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |
			\ set cindent |
			\ set colorcolumn=80

au BufNewFile,BufRead *.js,*.html,*.css,*.sls
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
			\ set expandtab |
			\ set autoindent

au BufNewFile,BufRead *.yaml,*.yml set filetype=ansible

let g:ansible_options = {'ignore_blank_lines': 0}

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.md
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4
set nu rnu
set ruler
set hlsearch
set so=7
syntax on
let g:pymode_python = 'python2'
let python_highlight_all = 1
let g:user_emmet_install_global = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:lasttab=1
"highlight BadWhitespace ctermbg=red guibg=darkred
autocmd FileType html,css EmmetInstall
au TabLeave * let g:lasttab = tabpagenr()
set autochdir
let python_highlight_all=1
set laststatus=2
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:blinkwait10


"
" Airline
let g:airline_extensions = ['tabline', 'whitespace', 'neomake']
let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename (no path) in the tab
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
"
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""
"MAP: key
"ESC key to jj
inoremap jj <Esc>

" Chuyen split
"
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" space folding
nnoremap <space> za
"
" function chay command:
nnoremap <silent> <F5> :w<CR>:!clear;python3 %<CR>
nnoremap <silent> <F6> :w<CR>:!clear;sage %<CR>
nnoremap <silent> <F4> :w<CR>:!clear;python2 %<CR>


" :w!! write with sudo
cmap w!! w !sudo tee > /dev/null %

"nmap /  <Plug>(incsearch-forward)
"nmap ?  <Plug>(incsearch-backward)
"nmap g/ <Plug>(incsearch-stay)

" Tab phai
" Tab trai



nnoremap <silent> <F12>c :!google-chrome-stable %<CR>
nnoremap <Leader>th :windo wincmd H<CR>
nnoremap <Leader>tk :windo wincmd K<CR>
" Go to tab by number
" Go to last active tab
nnoremap <silent> <leader>l :exe "tabn ".g:lasttab<CR>
vnoremap <silent> <leader>l :exe "tabn ".g:lasttab<CR>

"tab for switch windows
map <Tab> <C-W>w
map <S-Tab> <C-W>W
map <C-n> :NERDTreeToggle<CR>
"So dong + Enter la jump toi so' do VD 23Enter - > nhay toi line 23

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color: set color:
"





" highlight clear cursorline
" highlight cursorline gui=underline cterm=underline ctermfg=none guifg=none
" let nerdtreeshowhidden=1
" let NERDTreeDirArrowExpandable = '▷'
" let NERDTreeDirArrowCollapsible = '▼'
"set list
"set listchars=tab:‣\ ,trail:⋅,extends:❯,precedes:❮
"set showbreak=↪



let g:mdprewview_enabled=0
function! MarkDownToggle()
	if (&ft == 'markdown' || &ft == 'html' || &ft == 'rst')
		if (g:mdprewview_enabled)
			let g:mdprewview_enabled=0
			execute "MarkdownPreview"
		else
			let g:mdprewview_enabled=1
			execute "MarkdownPreview"
		endif
	endif
endfunction

nmap <F10> :call MarkDownToggle()<CR>
let g:mkdp_command_for_global = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard+=unnamedplus

"SET: Indent
let g:indentLine_enabled = 1
"SET: autopep8
"autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"let g:autopep8_aggressive=1
"let g:autopep8_disable_show_diff=1

"Optimize cursor
set cursorline!
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

set termguicolors " for truecolor
set background=dark
colorscheme flattened_dark

"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"highlight NonText ctermfg=grey cterm=none
"highlight linenr cterm=reverse

"highlight SignColumn guibg=#073642

"NerdComment
let g:NERDDefaultAlign = 'left'
"Pydocstring
nmap <silent> <C-_> <Plug>(pydocstring)

"deoplete-go
let g:deoplete#sources#go#gocode_binary = '/home/begood/.go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '/home/begood/.cache/deoplete-go/'

"autoformat
"noremap <F8> :Autoformat<CR>
"let g:formatter_yapf_style = 'pep8'


"neoformat
let g:neoformat_enabled_python = ['yapf', 'autopep8', 'docformatter']
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_trim = 1

noremap <F8> :Neoformat<CR>

" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars


"markdown
set conceallevel=0
