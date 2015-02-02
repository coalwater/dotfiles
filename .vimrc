" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
set shell=/bin/bash                                   " To avoid fish
let mapleader = " "                                   " Use space as Leader

"" Vundle
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nginx.vim'                                    " no idea yet
Plugin 'terryma/vim-multiple-cursors'                 " multiple cursor functionality, like sublime
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'                              " rails navigation and functions
Plugin 'scrooloose/nerdtree'                          " a file tree
Plugin 'bling/vim-airline'                            " the nice status line below
Plugin 'tpope/vim-fugitive'                           " Git commands
Plugin 'scrooloose/syntastic'                         " syntax
Plugin 'airblade/vim-gitgutter'                       " Git gutter
Plugin 'tpope/vim-surround'                           " Useful surround functions
Plugin 'tpope/vim-endwise'                            " Adding 'end' in ruby
Plugin 'tpope/vim-obsession'                          " Vim session saving
Plugin 'vim-scripts/molokai'                          " Molokai color theme
Plugin 'Lokaltog/vim-easymotion'                      " Use easy motion for search
Plugin 'majutsushi/tagbar'                            " Tag list
Plugin 'Valloric/YouCompleteMe'                       " Facny auto complete
Plugin 'ctrlpvim/ctrlp.vim'                           " fuzzy searching
call vundle#end()                                     " required

filetype plugin indent on                             " required


" " Obsession
" Load previsou session
nmap <F5> :source Session.vim<CR>

" " airline
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'dark'
" fix powerlines
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1          " shows tabs


" " CtrlP Settings
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
endif


" " color schemes
" Molokai colorscheme
let g:molokai_original = 1
colorscheme molokai                                   " The color scheme

" Tagbar
nmap <F8> :TagbarToggle<CR>

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" NERDTree customizations
let NERDTreeQuitOnOpen = 1
nnoremap <C-F> :NERDTreeFind<CR>                      " Ctrl+F triggers NERDTreeFind

" my settings "
set backspace=2                                       " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set showcmd                                           " display incomplete commands
set incsearch                                         " do incremental searching
set ignorecase
set smartcase
set autowrite                                         " Automatically :write before running commands
set timeoutlen=500
set t_Co=256
set nu                                                " show line numbers
set noeb vb                                           " Disable annoying bells
set laststatus=2                                      " show status line
set ruler
set showmatch                                         " show matching bracket
set nohlsearch                                        " remove highligting after search complete
set list listchars=tab:»·,trail:·,nbsp:·              " Display trailing whitespace and tabs
syntax on                                             " syntax highlighting

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

" Silly typos that i hate
command WQ wq
command Wq wq
command W w
command Q q

" Git gutter goodies
nnoremap <Leader><Right> :GitGutterPreviewHunk<CR>  " Leader + Right shows hunk
nnoremap <A-Down> :GitGutterNextHunk<CR>            " Alt + Down shows next hunk
nnoremap <A-Up> :GitGutterPrevHunk<CR>              " Alt + Up shows previous hunk

" alt + direction for buffer swapping
nnoremap <A-left> :bp<cr>
nnoremap <A-right> :bn<cr>

" Easy motion search to replace the default
map / <Plug>(easymotion-sn)

" space + q closes all
nnoremap <leader>q :qa<CR>

" NERDTree
" close vim when only NERDTree is remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree with F2
silent! nnoremap <F2> :NERDTreeToggle<CR>
