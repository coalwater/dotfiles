" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
set shell=/bin/bash                     " To avoid fish
let mapleader = " "                                                 " Use space as Leader

"" Vundle
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nginx.vim'                                                  " no idea yet
Plugin 'terryma/vim-multiple-cursors'                               " multiple cursor functionality, like sublime
Plugin 'tpope/vim-rails'                                            " rails navigation and functions
Plugin 'scrooloose/nerdtree'                                        " a file tree
Plugin 'bling/vim-airline'                                          " the nice status line below
Plugin 'tpope/vim-fugitive'                                         " Git commands
Plugin 'scrooloose/syntastic'                                       " syntax
Plugin 'airblade/vim-gitgutter'                                     " Git gutter
Plugin 'tpope/vim-surround'                                         " Useful surround functions
Plugin 'ctrlpvim/ctrlp.vim'                                         " fuzzy searching
call vundle#end()                                                   " required

filetype plugin indent on                                           " required

" " airline
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'dark'
" fix powerlines
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1                        " shows tabs


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1





set backspace=2   			                                            " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set showcmd       			                                            " display incomplete commands
set incsearch                                                       " do incremental searching
set ignorecase
set smartcase
set autowrite                                                       " Automatically :write before running commands
set timeoutlen=100
set t_Co=256
set nu                                                              " show line numbers
colorscheme desert                                                  " The color scheme
set noeb vb                                                         " Disable annoying bells
set laststatus=2                                                    " show status line
set ruler
set showmatch                                                       " show matching bracket
set nohlsearch                                                      " remove highligting after search complete
syntax on                                                           " syntax highlighting

" tabs and spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Move inside wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" space + w closes buffer
nnoremap <leader>w :bw<CR>
" space + q closes all
nnoremap <leader>q :qa<CR>

" NERDTree
" close vim when only NERDTree is remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree with F2
silent! nnoremap <F2> :NERDTreeToggle<CR>