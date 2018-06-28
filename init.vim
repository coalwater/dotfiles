" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set hidden
set backup
set backupdir=$HOME/.vim/backups,.
set background=dark
set showtabline=0
set rnu
set conceallevel=0
set guifont=DroidSansMono\ Nerd\ Font\ 11

set shell=/bin/bash                                   " To avoid fish
let mapleader = " "                                   " Use space as Leader

"" Vundle
" set the runtime path to include Vundle and initialize
filetype off
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug'
Plug 'terryma/vim-multiple-cursors'                 " multiple cursor functionality, like sublime
Plug 'tpope/vim-rails'                              " rails navigation and functions
Plug 'scrooloose/nerdtree'                          " a file tree
Plug 'bling/vim-airline'                            " the nice status line below
Plug 'tpope/vim-fugitive'                           " Git commands
Plug 'airblade/vim-gitgutter'                       " Git gutter
Plug 'tpope/vim-surround'                           " Useful surround functions
Plug 'tpope/vim-endwise'                            " Adding 'end' in ruby
Plug 'tpope/vim-obsession'                          " Vim session saving
Plug 'Lokaltog/vim-easymotion'                      " Use easy motion for search
Plug 'simnalamburt/vim-mundo'                       " History keeping
Plug 'editorconfig/editorconfig-vim'                " support for .editorconfig files
Plug 'Yggdroot/indentLine'                          " Show indentations easily
Plug 'ap/vim-css-color'                             " display colors in vim
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'qpkorr/vim-bufkill'
Plug 't9md/vim-quickhl'
Plug 'Shougo/deoplete.nvim'
Plug 'fishbullet/deoplete-ruby'
Plug 'stefanoverna/vim-i18n'
Plug 'tpope/vim-rhubarb'
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'                              " color scheme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'garbas/vim-snipmate'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'ryanss/vim-hackernews'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'mxw/vim-jsx'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh' }
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'ryanoasis/vim-devicons'

call plug#end()

set maxmempattern=200000
set cursorline

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://127.0.0.1:7658'],
    \ }

"neomake
autocmd BufWritePost,BufEnter * Neomake
let g:neomake_highlight_columns = 5
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri', 'reek']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_logfile = "$HOME/.log/neomake.log"
let g:neomake_error_sign = {
      \ 'text': '✗',
      \ 'texthl': 'NeomakeErrorSign'
      \ }
let g:neomake_warning_sign = {
      \ 'text': '⚠',
      \ 'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_message_sign = {
      \ 'text': '➤',
      \ 'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {
      \ 'text': 'ℹ',
      \ 'texthl': 'NeomakeInfoSign'
      \ }

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" " Obsession
" Load previsou session
nmap <F5> :source Session.vim<CR>

" " airline
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'gruvbox'

" fix powerlines
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1          " shows tabs

"airline sections
let g:airline_section_w = airline#section#create(['%{ObsessionStatus()}'])

" FZF
if !isdirectory(".git")
  map <C-p> :Files<cr>
else
  map <C-p> :GFiles --cached --others --exclude-from="$HOME/.gfiles"<cr>
endif
map <M-p> :BTags<cr>
map <M-P> :Tags<cr>
map <M-o> :Buffers<cr>
map <M-L> :Lines<cr>
map <M-M> :Marks<cr>

" rails.vim settings
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" ruby.vim settings
let ruby_spellcheck_strings = 1

" NERDTree customizations
silent! nnoremap <F2> :NERDTreeToggle<CR>             " Toggle NERDTree with F2

let NERDTreeQuitOnOpen = 1                            " Close nerd tree after opening a file
nnoremap <C-F> :NERDTreeFind<CR>                      " Ctrl+F triggers NERDTreeFind

" my settings "
set backspace=2                                       " Backspace deletes like most programs in insert mode
set ignorecase
set smartcase
set timeoutlen=500
set t_Co=256
set nu                                                " show line numbers
set noeb vb                                           " Disable annoying bells
set showmatch                                         " show matching bracket
set nohlsearch                                        " remove highligting after search complete
set list listchars=tab:»·,trail:·,nbsp:·              " Display trailing whitespace and tabs

"saving files when moving away
set autowrite                                         " Automatically :write before running commands
au FocusLost * silent! wa


" tabs and spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=40

" Move inside wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" space + w closes buffer
nnoremap <leader>w :BD<CR>
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
nnoremap <Leader><Leader><Left> :GitGutterUndoHunk<CR>    " Leader + Leader + left reverts hunk

" alt + direction for buffer swapping
noremap <M-h> :bp<cr>
noremap <M-l> :bn<cr>

" Easy motion search to replace the default
map / <Plug>(easymotion-sn)


" Mundo shortcut
nnoremap <F4> :MundoToggle<CR>
let g:mundo_preview_bottom = 1
let g:mundo_close_on_revert = 1
let g:mundo_width = 30
let g:mundo_preview_height = 40

set undofile                                       "  Save undo's after file closes
set undodir=$HOME/.vim/undo,.                      "  where to save undo histories
set undolevels=1000                                "  How many undos
set undoreload=10000                               "  number of lines to save for undo

set directory=$HOME/.vim/swap,.

" highlighting indentation settings
let g:indentLine_char = '│'

" Indentation doesn't exit visual mode
vnoremap < <gv
vnoremap > >gv

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-s> :w<cr>                                " ctrl + s for saving

" Ag search
map <leader>s :Ag <cword>
nmap  <silent> <leader>e :Ggrep "<cword>" <CR>

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
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DastrkOrchid3'],
      \ ]

let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" color schemes
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
colorscheme gruvbox

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
vmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)

nnoremap <M-F> gg=G``
set colorcolumn=81,121

vmap <Leader>st :call I18nTranslateString()<CR>
vmap <Leader>gt :call I18nDisplayTranslation()<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

autocmd QuickFixCmdPost *grep* cwindow

let g:tagbar_show_visibility = 1

command F :let @+=expand("%")
command Rip :NeomakeSh fish -c 'ripper-tags -R --exclude=vendor'

function! Multiple_cursors_before()
  if exists('g:deoplete#disable_auto_complete')
    let g:deoplete#disable_auto_complete = 1
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists('g:deoplete#disable_auto_complete')
    let g:deoplete#disable_auto_complete = 0
  endif
endfunction