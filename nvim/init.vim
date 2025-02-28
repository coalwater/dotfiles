set backup
set undofile                                       "  Save undo's after file closes
set backupdir=$HOME/.local/nvim/backups
set undodir=$HOME/.local/nvim/undo              "  where to save undo histories
set directory=$HOME/.local/nvim/swap
set background=dark
set showtabline=0
set wildmenu
set wildmode=longest:full,full

" set rnu
set cole=0
autocmd FileType * setlocal conceallevel=0
let g:vim_json_syntax_conceal = 0
set lbr
set mouse=a

set shell=/usr/bin/fish                               " To avoid fish
let mapleader = " "                                   " Use space as Leader
let g:loaded_perl_provider = 0

"" Vundle
" set the runtime path to include Vundle and initialize
filetype off
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug'
Plug 'terryma/vim-multiple-cursors'                 " multiple cursor functionality, like sublime
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'                              " rails navigation and functions
Plug 'scrooloose/nerdtree'                          " a file tree
Plug 'bling/vim-airline'                            " the nice status line below
Plug 'vim-airline/vim-airline-themes'
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
Plug 'qpkorr/vim-bufkill'
Plug 't9md/vim-quickhl'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'stamblerre/gocode'
Plug 'tpope/vim-rhubarb'
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'                              " color scheme
Plug 'majutsushi/tagbar'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'mhinz/vim-startify'
Plug 'slim-template/vim-slim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'honza/vim-snippets'
Plug 'yaymukund/vim-rabl'
Plug 'tomtom/tlib_vim'
Plug 'dag/vim-fish'
Plug 'ryanoasis/vim-devicons'
Plug 'mustache/vim-mustache-handlebars'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hashivim/vim-terraform'
Plug 'mrded/vim-github-codeowners'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'epwalsh/obsidian.nvim'

call plug#end()

set maxmempattern=200000
set cursorline

tnoremap <C-q> <C-\><C-n>

" NERDTree
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.swp$', '\.pyc$', '\.pyo$', '\.rbc$', '\.pyd$', '\.gem$', '\.class$', '\.o$', '\.so$', '\.a$', '\.dll$', '\.exe$', '\.lib$', '\.ncb$', '\.sdf$', '\.suo$', '\.pdb$', '\.idb$', '\.DS_Store$', '\.git$', '\.hg$', '\.svn$', '\.bzr$', '\.CVS$', '\.DS_Store$', '\.gitignore$', '\.gitmodules$', '\.gitattributes$', '\.gitkeep$', '\.hgignore$', '\.hgsub$', '\.hgsubstate$', '\.hgtags$', '\.svnignore$', '\.svn/']
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinPos = "left"

"neomake
autocmd BufWritePost,BufEnter * Neomake
let g:neomake_highlight_columns = 5
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_ruby_rubocop_exe = 'bin/rubocop'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_css_enabled_makers = ['csslint']
"let g:neomake_go_enabled_makers = ['go', 'govet']
"call neomake#configure#automake('nrw', 200)
call neomake#configure#automake({
      \ 'TextChanged': {},
      \ 'InsertLeave': {},
      \ 'BufWritePost': {'delay': 0},
      \ 'BufWinEnter': {},
      \ }, 2000)
let g:neomake_error_sign = {
      \ 'text': '',
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
      \ 'text': '>>',
      \ 'texthl': 'NeomakeInfoSign'
      \ }


" coc
let g:coc_node_path = '/opt/homebrew/bin/node'
inoremap <expr><TAB>  pumvisible() ? coc#pum#next(1) : "\<TAB>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><c-space> pumvisible() ? "\<C-y>" : "\<space>"
inoremap <expr><space> pumvisible() ? "\<C-y>\<space>" : "\<space>"

xmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>a  <Plug>(coc-codeaction)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" " Obsession
" Load previsou session
nmap <F5> :source Session.vim<CR>

" " airline
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 1
let g:airline_theme = 'deus'
let g:airline_section_b = '%{strftime("%H:%M")}'

let g:airline#extensions#tabline#enabled = 1          " shows tabs

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_skip_empty_sections = 1
let g:airline_symbols.linenr = ''
let g:airline_left_sep = "" "\uE0C6
let g:airline_right_sep = "" "\uE0C7

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

" Markdown width 80
au BufRead,BufNewFile *.md setlocal textwidth=80


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
nnoremap <leader>w :BufferClose<CR>
" space + q closes all buffers
nnoremap <leader>q :%bd<CR>
" space + space + q closes all
nnoremap <leader><leader>q :qa<CR>
nnoremap <leader>h :History<CR>

noremap <leader>gf :e <cfile><cr>

" Silly typos that i hate
command WQ wq
command Wq wq
command W w
command Q q

" Git gutter goodies
function! s:SafeCNext()
  if len(getqflist()) > 0
    cnext
  else
    GitGutterNextHunk
  endif
endfunction
function! s:SafeCPrev()
  if len(getqflist()) > 0
    cprevious
  else
    GitGutterPrevHunk
  endif
endfunction


nnoremap <Leader><Right> :GitGutterPreviewHunk<CR>
nnoremap <silent> <M-j> :call <SID>SafeCNext()<CR>
nnoremap <silent> <M-k> :call <SID>SafeCPrev()<CR>
nnoremap <Leader><Leader><Left> :GitGutterUndoHunk<CR>

nnoremap <M-J> :NeomakeNextLoclist<CR>
nnoremap <M-K> :NeomakePrevLoclist<CR>

" alt + direction for buffer swapping
noremap <M-h> :BufferPrevious<cr>
noremap <M-l> :BufferNext<cr>
noremap <M-Left> :BufferMovePrevious<cr>
noremap <M-Right> :BufferMoveNext<cr>


" Easy motion search to replace the default
map / <Plug>(easymotion-sn)


" Mundo shortcut
nnoremap <F4> :MundoToggle<CR>
let g:mundo_preview_bottom = 1
let g:mundo_close_on_revert = 1
let g:mundo_width = 30
let g:mundo_preview_height = 40

set undolevels=1000                                "  How many undos
set undoreload=10000                               "  number of lines to save for undo


" highlighting indentation settings
let g:indentLine_char = '│'

" Indentation doesn't exit visual mode
vnoremap < <gv
vnoremap > >gv

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" exit terminal
tnoremap <S-Esc> <C-\><C-n>

" Ag search
let g:fzf_layout = { 'window': { 'width': 0.97, 'height': 0.97, 'highlight': 'Normal', 'border': 'rounded', 'yoffset': 0.1 } }
let g:fzf_preview_window = ['right:50%:wrap']  " Make the preview window wider
let $FZF_DEFAULT_OPTS = '--layout=reverse'
nmap  <silent><leader>e :call fzf#vim#ag(expand('<cword>'), fzf#vim#with_preview())<CR>
nmap  <silent><leader>E :call fzf#vim#ag(expand('<cWORD>'))<CR>
nmap <silent><M-]> :call fzf#vim#tags(expand('<cword>') . " ", fzf#vim#with_preview({ "placeholder": "--tag {2}:{-1}:{3..}" }))<CR>

command! Agword call fzf#vim#ag('<cword>')

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
let g:gruvbox_contrast_dark = 'light'
let g:gruvbox_italic = 1
colorscheme gruvbox

" vim-quickhl
nmap <Leader>m <Plug>(quickhl-manual-this)
vmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>M <Plug>(quickhl-manual-reset)

nnoremap <M-F> gg=G``
set colorcolumn=81

vmap <Leader>st :call I18nTranslateString()<CR>
vmap <Leader>gt :call I18nDisplayTranslation()<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

autocmd QuickFixCmdPost *grep* cwindow

let g:tagbar_show_visibility = 1

command F :let @+=expand("%")
command GenerateRipperTags :NeomakeSh fish -c "ripper-tags -R --exclude='public' .; and notify-send -u low --app-name 'dipper Tags' 'done'"
command -range=% StringifyHash <line1>,<line2>s/\(\w\+\):/'\1' =>/g
command -range=% SymbolizeHash <line1>,<line2>s/'\([^']*\)'\s*=>/\1:\2/g
command -range=% NewHash <line1>,<line2>s/\:\(\w\+\)\s\+\s*=>\s\+/\1: /g
map <M-r> :GenerateRipperTags<cr>


" copilot
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true
let g:copilot_tab_fallback = ""
imap <silent><script><expr> <M-Enter> copilot#Accept("\<CR>")


nnoremap <F9> :CopilotChatToggle<CR>
autocmd BufRead COMMIT_EDITMSG :CopilotChatCommit

"

func! Multiple_cursors_before()
  exe 'CocDisable'
endfunc

func! Multiple_cursors_after()
  exe 'CocEnable'
endfunc

lua << EOF
require("CopilotChat").setup {
  system_prompt = [[
  You are a dynamic technical assistant that adapts its expertise based on the current context (code, documentation, architecture, debugging, etc.).

  • Main Communication approach:
   - Start with high-level overview (architecture, patterns, key components)
   - Include key trade-offs, risks, and alternatives with their implications
   - Avoid implementation details in initial response
   - Focus on relationships and system-level concepts first
   - Note important details that can be expanded upon request
   - Conclude with relevant professional opinions and concerns based on experience

  • When clarification is needed:
   - First compile a complete list of necessary questions
   - Present them in order of priority/dependency
   - Ask one question at a time, waiting for response
   - Track answered questions and maintain context through the conversation

  • When in debugging context:
   - First identify the error type (syntax, runtime, configuration, integration)
   - Suggest minimal reproduction steps
   - Propose incremental verification steps
   - Recommend logging/diagnostic approaches when relevant
  ]],
  debug = false,
  show_help = "yes",
  model = "claude-3.5-sonnet",
  temperature = 0.1,
  chat_autocomplete = false,
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  event = 'VeryLazy',
  context = 'buffers',
  history_path = vim.fn.stdpath('data') .. '/copilotchat_history',
  save_history = true,
  prompts = {} -- Remove all the separate mode prompts
}

require("obsidian").setup {
  workspaces = {
    {
      name = "personal",
      path = "~/Sync/Obsidian",
    },
  }
}
EOF

nnoremap <leader>ff :CopilotChatFiles<CR>
nnoremap <leader>cc :CopilotChatReset<CR>
command! CopilotChatFiles
    \ call fzf#run(fzf#wrap({
    \ 'source': 'git ls-files',
    \ 'sink*': {lines -> [
    \   setreg('"', join(map(lines, '"#file:" . v:val'), "\n")),
    \   execute('CopilotChatToggle'),
    \   execute('normal! pO')
    \ ]},
    \ 'options': ['--multi'],
    \ }))

nnoremap <leader>fd :CopilotChatDirs<CR>
command! CopilotChatDirs
    \ call fzf#run(fzf#wrap({
    \ 'source': 'find . -type d -not -path "*/\.*"',
    \ 'sink': function('s:HandleDirSelection'),
    \ }))

function! s:HandleDirSelection(dir) abort
    call fzf#run(fzf#wrap({
    \ 'source': printf('find %s -type f -not -path "*/\.*"', shellescape(a:dir)),
    \ 'sink*': {lines -> [
    \   setreg('"', join(map(lines, '"#file:" . v:val'), "\n")),
    \   execute('CopilotChatToggle'),
    \   execute('normal! pO')
    \ ]},
    \ 'options': ['--multi'],
    \ }))
endfunction
