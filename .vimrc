" Disable vi-compatibility
set nocompatible

" NeoBundle all

if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" Search
NeoBundle 'rking/ag.vim'

" File browsing
NeoBundle 'junegunn/fzf'
NeoBundle 'kien/ctrlp.vim'

" Working with Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Code syntax
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'JulesWang/css.vim'
NeoBundle 'wavded/vim-stylus.git'
" NeoBundle 'pangloss/vim-javascript'
NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload': {
    \ 'filetypes': ['javascript']
    \  } }
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leshill/vim-json.git'
NeoBundle 'digitaltoad/vim-jade.git'
NeoBundle 'tpope/vim-haml'

" NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'mattn/emmet-vim'

" Color themes
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'langolf/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'chriskempson/base16-vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'ervandew/supertab'
"NeoBundle 'porqz/KeyboardLayoutSwitcher' "For swithing keyboard layout after esc ru>en
NeoBundle 'godlygeek/tabular.git'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()

filetype plugin indent on
syntax enable

NeoBundleCheck

"===============================================================================
" General Settings
"===============================================================================

syntax on

set clipboard=unnamed

" Turn on line number
set number

set ttyfast
set timeoutlen=1000
set ttimeoutlen=0

" Always splits to the right and below
set splitright
set splitbelow

" Highlighting current line
set cursorline

" Colorschemes diff settings
set t_Co=256
colorscheme hybrid
set background=dark
let g:hybrid_use_Xresources=1

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Sets how many lines of history vim has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
let &showbreak = '↳ '
set showbreak=\ \
set breakindent
set breakindentopt=sbr

" mouse
set mouse=a

" set the cursor to a vertical line in insert mode and a solid block in command mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Disable highlighting lines over 128 symbols
" set synmaxcol=128

" Min width of the number column to the left
set numberwidth=2

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=start,indent,eol

" Case insensitive search
set ignorecase
set smartcase
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
set termencoding=utf-8
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
set autoindent
set wrap

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" Leader Key Mappings

" Map leader and localleader key to comma
let mapleader = "\<Space>"

" Disable <Arrow keys>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

:imap jk <Esc>
:imap jj <Esc>

" Fast indent command
  nnoremap > >gv
  nnoremap < <gv

" Toggle Folding {{{
set foldmethod=marker
nnoremap \ za
vnoremap \ za

" }}}

" arrow key to navigate windows
noremap <Down> <C-W>j
noremap <Up> <C-W>k
noremap <Left> <C-W>h
noremap <Right> <C-W>l

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
nmap <C-f> :Ag <c-r>=expand("<cword>")<cr><cr>

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Ctrlp

let g:ctrlp_show_hidden=1
nnoremap <C-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\(node_modules|bower)$',
  \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor -f -U -g ""'

" NERDTree & Vimfiles
nnoremap <silent><leader>k :NERDTreeToggle<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" FZF
" =====================
nnoremap <silent> <Leader><Leader> :FZF -m<CR>
"
" " Open files in horizontal split
nnoremap <silent> <C-p> :call fzf#run({
\   'tmux_height': '40%',
\   'sink':        'botright split' })<CR>
" "
" " Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'tmux_width': winwidth('.') / 2,
\   'sink':       'vertical botright split' })<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" AutoReload .vimrc
" Source the vimrc file after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Custom functions

" Delete lastline
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

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