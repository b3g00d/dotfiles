" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe', { 'do': 'CC=gcc-8 CXX=g++-8 python3 ./install.py' }
"Plug 'powerline/powerline'
"Plug 'uber/prototool', { 'rtp':'vim/prototool' , 'for': 'proto'}
Plug 'rhysd/vim-healthcheck'
Plug 'psf/black', {'for': 'python'}
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'tpope/vim-fugitive' " dành cho git
Plug 'tpope/vim-surround' " đóng ngoặc cho vim
Plug 'ryanoasis/vim-devicons' " Icon cho vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for': 'go'}
Plug 'romainl/flattened'
Plug 'dense-analysis/ale' "Check lỗi syntax
Plug 'SirVer/ultisnips' "Hỗ trợ gợi ý văn bản
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets' "để tạo những snippet file
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'buoto/gotests-vim', {'for': 'go'}
Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
" Plug 'vim-erlang/vim-erlang-compiler', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang', {'for': 'erlang'}

Plug 'tomlion/vim-solidity', {'for': 'solidity'}
Plug 'sohkai/syntastic-local-solhint', {'for': 'solidity'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install prettier prettier-plugin-solidity',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift',
    \ 'solidity'] }

"Plug 'vim-scripts/ZoomWin'

call plug#end()

autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1
filetype plugin indent on
"black
let g:black_virtualenv="~/.vim_black"

"autoformat
noremap <F8> :Autoformat<CR>
let g:formatter_yapf_style = 'facebook'
"let g:formatdef_black = '"black -l 79 -q ".(&textwidth ? "-l".&textwidth : "")." -"'
let g:formatters_python = ['black']
let g:formatters_sql = ['sqlformat']

" default
syntax enable
set splitright
set splitbelow
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set pastetoggle=<F3>
set formatoptions-=cro
set completeopt-=preview


set nu rnu
set ruler
set hlsearch
set so=7
syntax on
let g:pymode_python = 'python3'
let g:user_emmet_install_global = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:lasttab=1
"highlight BadWhitespace ctermbg=red guibg=darkred
autocmd FileType html,css
au TabLeave * let g:lasttab = tabpagenr()
" set autochdir
set laststatus=2
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:blinkwait10

" Mapping: key
" ESC key to jj
"
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" space folding
nnoremap <space> za
"

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
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set guifont=Fira\ Code:h12
let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"Optimize cursor
set cursorline!
set lazyredraw
"set synmaxcol=128
syntax sync minlines=256

set termguicolors " for truecolor
set term=screen-256color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=light
colorscheme flattened_light
"colorscheme solarized8_dark
"colorscheme solarized
"let g:solarized_termcolors=256




"NerdComment
let g:NERDDefaultAlign = 'left'

"ALE
let g:ale_completion_enabled = 0
let b:ale_linters = {'json': ['jsonlint']}
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
"snippet

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
set clipboard^=unnamedplus

"auto-pairs
"System Shortcuts:
"    <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"    <BS>  : Delete brackets in pair
"    <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"    <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"    <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"    <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

"If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add

"    let g:AutoPairsShortcutToggle = '<another key>'

"to .vimrc, if the key is empty string '', then the shortcut will be disabled.
let g:AutoPairsShortcutToggle="<M-p>"

"ycm
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "python":1,
			\ }

" Set swp, backup file
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//


" Vim-go
let g:go_fmt_command = "goreturns"


" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" fzf

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
"let g:fzf_preview_window = []
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, {'options': ['--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
\                 <bang>0 ? fzf#vim#with_preview('up:60%')
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)
