call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'

" Color Scheme
Plug 'morhetz/gruvbox'

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

" NERDTRee
Plug 'scrooloose/nerdtree'

" Add plugins to &runtimepath
call plug#end()

" map leader
let mapleader=","

"UI Things
syntax on " turns syntax highlighting on
if has('gui_running')
    colorscheme gruvbox
    set background=dark
endif

set number " show line numbers
set cursorline " highlight the current line
filetype indent on " indenting for file types
set lazyredraw " only redraw when needed
set showmatch " highlight matching brackets
set wildmenu " visual autocomplete for command menu

set incsearch " search as characters are entered
set hlsearch " highlights search matches
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

let NERDTreeIgnore=['\.pyc$']

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
