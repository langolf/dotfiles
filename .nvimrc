" Disable vi-compatibility
set nocompatible

"===============================================================================
" NeoBundle
"===============================================================================

if has ('vim_starting')
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Fuzzy search
NeoBundle 'rking/ag.vim'

" File browsing
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'dbakker/vim-projectroot'

" Searching and replace in diff places
NeoBundle 'dyng/ctrlsf.vim'

" Working with Git
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'

" Code syntax
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'JulesWang/css.vim'
NeoBundle 'wavded/vim-stylus.git'
"NeoBundle 'othree/html5.vim.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leshill/vim-json.git'
NeoBundle 'digitaltoad/vim-jade.git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'marijnh/tern_for_vim'

" For closing {}
NeoBundle 'rstacruz/vim-closer'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'mattn/emmet-vim'

" Color themes
NeoBundle 'langolf/vim-colors-solarized'
NeoBundle 'szw/seoul256.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ervandew/supertab'

"For swithing keyboard layout after esc ru>en
"NeoBundle 'porqz/KeyboardLayoutSwitcher'
" NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'godlygeek/tabular.git'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'tpope/vim-endwise'
"NeoBundle 'tpope/vim-rails'

call neobundle#end()

filetype plugin indent on
syntax enable

NeoBundleCheck

"===============================================================================
" General Settings
"===============================================================================

syntax on

set clipboard=unnamed

set timeoutlen=1000
set ttimeoutlen=0

" Turn on line number
set number

" Always splits to the right and below
set splitright
set splitbelow

" Highlighting current line
set cursorline

" Colorschemes diff settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme base16-ocean

" Tell Vim to use dark background
set background=dark

" Sets how many lines of history vim has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set showbreak=↪
set showbreak=\ \


" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Disable highlighting lines over 128 symbols
"set synmaxcol=128

" Min width of the number column to the left
set numberwidth=2

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=node_modules/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=start,indent,eol
" set noeol

" Case insensitive search
set ignorecase
set smartcase

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Don't show matching brackets
set noshowmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
set encoding=utf-8 nobomb
set fileencodings=utf8,cp1251
set fileformat=unix

" Use Unix as the standart file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

" Text display settings
" set textwidth=120
set autoindent
set wrap

set mouse=a

" Whitspace
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END
autocmd BufWritePre * :%s/\s\+$//e

let g:kls_insertEnterRestoresLast=2

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = "\<Space>"

:imap jk <Esc>
:imap jj <Esc>

nnoremap j gj
nnoremap k gk

" Fast indent command
:noremap > >gv
:noremap < <gv

inoremap <C-/> //

" Toggle Folding {{{
"set foldmethod=marker
nnoremap \ za
vnoremap \ za

" }}}

" Move between splits
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" Switch tabs with <Tab>
nmap <Tab> gt
nmap <S-Tab> gT

" Save ,w
map <leader>w <esc>:w<CR>
" Source
map <leader>s <esc>:so%<CR>

" Insert blank lines without going into Insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" Open the .vimrc in a new tab
nmap <leader>e :vsp $MYVIMRC<CR>

" Ag
nnoremap <leader>a :Ag

" Ctrlp
" let g:ctrlp_show_hidden=0
nnoremap <C-b> :CtrlPBuffer<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\(node_modules|bower|tmp)$',
  \ 'file': '\v\.(jpg|png|gif|woff|mp3)$'
  \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor -f -U -g ""'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a0":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"===============================================================================
" KeyboardLayoutSwitcher
"===============================================================================

let g:kls_defaultInputSourceIndex = 0


" ==========================================
" NERDTree & Vimfiles
" =========================================

nnoremap <silent><leader>k :NERDTreeToggle<CR>

" ===========================================
" Ultisnips
" ==========================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"" AutoReload .vimrc
"" See http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
"" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif


" --- toggle autocomplete behavior and word delimiters ---
function! KeywordsAll()
   setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
  setl iskeyword=@,48-57,192-255
endfunc

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll()<CR> *
nnoremap # :silent call KeywordsAll()<CR> #

augroup mm_buf_cmds
  autocmd!
  au WinLeave,InsertEnter * set nocul
  au WinEnter,InsertLeave * set cul
  autocmd InsertEnter,BufLeave * :silent call KeywordsAll()
  autocmd InsertLeave,BufEnter * :silent call KeywordsBasic()
  " yes, we need to duplicate it on VimEnter for some weird reason
  autocmd VimEnter * nnoremap * :silent call KeywordsAll()<CR> *
  autocmd VimEnter * nnoremap # :silent call KeywordsAll()<CR> #
augroup END

au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction