" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'powerline/powerline'
Plug 'rhysd/vim-healthcheck'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'romainl/flattened'
Plug 'w0rp/ale'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"autoformat
noremap <F8> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'

" default
syntax enable
set splitright
set splitbelow
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set pastetoggle=<F3>
set formatoptions-=cro


filetype plugin indent on

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
let g:pymode_python = 'python3'
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

" Mapping: key
" ESC key to jj
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




" vim-devicons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"

"Optimize cursor
set cursorline!
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

set termguicolors " for truecolor
set term=screen-256color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme flattened_dark
"colorscheme solarized8_dark
"colorscheme solarized
"let g:solarized_termcolors=256




"NerdComment
let g:NERDDefaultAlign = 'left'

"ALE
let g:ale_completion_enabled = 1
let b:ale_fixers = {'python': ['autopep8', 'yapf']}
let b:ale_linters = {'python': ['flake8']}
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#enabled = 1

"snippet

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
