call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
Plug 'idbrii/vim-sandydune'
Plug 'jonathanfilip/vim-lucius'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto brackets and stuff
Plug 'Raimondi/delimitMate'

" Rainbow Parenthesis
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 " activates the plugin

" scala syntax highlighting
Plug 'derekwyatt/vim-scala'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Add plugins to &runtimepath
call plug#end()

" map leader
let mapleader=","

"UI Things
syntax on " turns syntax highlighting on
colorscheme solarized
:let g:airline_theme='solarized' " Set theme of airline
set background=dark

set number " show line numbers
set cursorline " highlight the current line
filetype indent on " indenting for file types
set lazyredraw " only redraw when needed
set showmatch " highlight matching brackets
set wildmenu " visual autocomplete for command menu

set incsearch " search as characters are entered
set hlsearch " highlights search matches
" unhighlight after we are done searching
nnoremap <leader><space> :nohlsearch<CR>

" For tabbing and stuff
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"Remove sidebars
:set guioptions-=L
:set guioptions-=l
:set guioptions-=R
:set guioptions-=r


au VimEnter *  NERDTree " Open NERDTree automatically

"Spell checking
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

"Text wrapping
au BufRead,BufNewFile *.md setlocal textwidth=100
au BufRead,BufNewFile *.txt setlocal textwidth=100
au BufRead,BufNewFile *.tex setlocal textwidth=100

" Auto reload .vimrc whenever there is a change
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

:au FocusLost * :wa " autosave file

:set mouse=nicr
