" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
set background=dark


set shell=/bin/bash                                   " To avoid fish
let mapleader = " "                                   " Use space as Leader

"" Vundle
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'nginx.vim'                                    " color coding for nginx filetype
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
Plugin 'Lokaltog/vim-easymotion'                      " Use easy motion for search
Plugin 'Valloric/YouCompleteMe'                       " Fancy auto complete
Plugin 'simnalamburt/vim-mundo'                       " History keeping
Plugin 'editorconfig/editorconfig-vim'                " support for .editorconfig files
Plugin 'Yggdroot/indentLine'                          " Show indentations easily
Plugin 'ctrlpvim/ctrlp.vim'                           " fuzzy searching
Plugin 'edkolev/tmuxline.vim'                         " tmux with airline
Plugin 'ap/vim-css-color'                             " display colors in vim
Plugin 'StanAngeloff/php.vim'                         " php ctags
Plugin 'troydm/zoomwintab.vim'                        " split windows maximize and minimize
Plugin 'christoomey/vim-tmux-navigator'               " tmux navigator
Plugin 'wesQ3/vim-windowswap'                         " moving splits
Plugin 'kien/rainbow_parentheses.vim'

" color schemes
Plugin 'vim-scripts/molokai'
Plugin 'romainl/Apprentice'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'

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

" backup path
set backupdir=~/.vim/backups

" " CtrlP Settings
" ctrlp exclude
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v\.(git|hg|svn|orig)$|\vtmp|\vdoc|\vcoverage|\vtags',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" utility shorcuts for ctrlp
map <M-p> :CtrlPBufTag<cr>                           " list all tags in current open buffer
map <M-o> :CtrlPBuffer<cr>                           " list buffers for select

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = {
  "  'fallback': 'ag %s -l --nocolor -g ""',
  "  'ignore': 1
  "  }

  let g:ctrlp_use_caching = 0
endif


" syntastic
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_rubocop_args = '-c .rubocop.yml --force-exclusion'
:
let g:syntastic_ruby_exec = 'ruby'
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'flog']

" rails.vim settings
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" ruby.vim settings
let ruby_spellcheck_strings = 1

" NERDTree customizations
silent! nnoremap <F2> :NERDTreeToggle<CR>             " Toggle NERDTree with F2

let NERDTreeQuitOnOpen = 1                            " Close nerd tree after opening a file
nnoremap <C-F> :NERDTreeFind<CR>                      " Ctrl+F triggers NERDTreeFind

" my settings "
set backspace=2                                       " Backspace deletes like most programs in insert mode
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
set scrolloff=999

" Move inside wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" space + w closes buffer
nnoremap <leader>w :bd<CR>
" space + w closes location buffer
nnoremap <leader>l :lclose<CR>
" space + q closes all buffers
nnoremap <leader>q :%bd<CR>
" space + space + q closes all
nnoremap <leader><leader>q :qa<CR>

" Silly typos that i hate
command WQ wq
command Wq wq
command W w
command Q q

" Git gutter goodies
nnoremap <Leader><Right> :GitGutterPreviewHunk<CR>          " Leader + Right shows hunk
nnoremap <M-j> :GitGutterNextHunk<CR>                    " Alt + Down shows next hunk
nnoremap <M-k> :GitGutterPrevHunk<CR>                      " Alt + Up shows previous hunk
nnoremap <Leader><Leader><Left> :GitGutterRevertHunk<CR>    " Leader + Leader + left reverts hunk

" alt + direction for buffer swapping
nnoremap <F11> :bp<cr>
nnoremap <F12> :bn<cr>

" Easy motion search to replace the default
map / <Plug>(easymotion-sn)


" Gundo shortcut
nnoremap <F4> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
let g:gundo_width = 30
let g:gundo_preview_height = 40

set undofile                                       "  Save undo's after file closes
set undodir=$HOME/.vim/undo                        "  where to save undo histories
set undolevels=1000                                "  How many undos
set undoreload=10000                               "  number of lines to save for undo


" tmux navigator settings
let g:tmux_navigator_save_on_switch = 1

" highlighting indentation settings
let g:indentLine_char = '│'

" Indentation doesn't exit visual mode
vnoremap < <gv
vnoremap > >gv

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" create file if not exist
map <leader>gf :e <cfile><cr>

map <C-s> :w<cr>                                " ctrl + s for saving
map <M-q> :SyntasticToggleMode<cr>              " Run the syntastic checks

" more natural splitting locations
set splitbelow
set splitright

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DastrkOrchid3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16

" color schemes
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
colorscheme gruvbox
