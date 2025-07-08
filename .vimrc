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

" NERDTRee
Plug 'scrooloose/nerdtree'

" Syntax support
Plug 'sheerun/vim-polyglot'

" Window swapping
Plug 'wesQ3/vim-windowswap'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" current line highlighting
Plug 'miyakogi/conoline.vim'

" Add plugins to &runtimepath
call plug#end()

" map leader
let mapleader=","

"UI Things
syntax on " turns syntax highlighting on
set background=dark
let g:rainbow_active = 1 " activates the plugin

colorscheme gruvbox
if strftime("%H") < 17 && strftime("%H") > 6
    " set background=light
else
    set background=dark
endif

if has('gui_running')
    colorscheme gruvbox
    set guifont=Hack:h14
endif

set number " show line numbers
" set cursorline " highlight the current line
filetype indent on " indenting for file types
filetype plugin on
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

"Hot-reload
set autoread
set backspace=indent,eol,start

"disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" allow for mouse
set mouse=a

" paste mode
set pastetoggle=<F3>

" change cwd for each tab
set autochdir

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Change buffers without saving
set hidden

" fzf stuff
" customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" assumes pygments is installed
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"
let $FZF_PREVIEW_COMMAND="pygmentize -g -O style=gruvbox-dark {}"

" use location of .git/ as bath path to search for things
function! GitFZF()
    let path = trim(system('cd '.shellescape(expand('%:p:h')).' && git rev-parse --show-toplevel'))
    if !isdirectory(path)
        let path = expand('%:p:h')
    endif
    call fzf#vim#files(path, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}))
endfunction
command! GitFiles call GitFZF()

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'grep -rn --color '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

nnoremap <C-p> :GitFiles<CR>
nnoremap <C-l> :VolovFiles<CR>
nmap <leader>bb :Buffer<CR>
nmap <leader>gg :Rg<CR>
nmap <leader>gl :PRg<CR>

" line highlighting
let g:conoline_auto_enable=1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1
