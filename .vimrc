" Disable vi-compatibility
set nocompatible

"===============================================================================
" NeoBundle
"===============================================================================

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

" Fuzzy search
NeoBundle 'rking/ag.vim'

" File browsing
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'junegunn/fzf'
NeoBundle 'kien/ctrlp.vim'
" Working with Git
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'

" Code syntax
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'wavded/vim-stylus.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leshill/vim-json.git'
NeoBundle 'digitaltoad/vim-jade.git'
NeoBundle 'tpope/vim-haml'

NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Raimondi/delimitMate'

" Color themes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'szw/seoul256.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'godlygeek/csapprox'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'ervandew/supertab'
"NeoBundle 'porqz/KeyboardLayoutSwitcher' "For swithing keyboard layout after esc ru>en
NeoBundle 'godlygeek/tabular.git'
NeoBundle 'tpope/vim-commentary'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'

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

" Always splits to the right and below
set splitright
set splitbelow

" Highlighting current line
set cursorline

" Colorschemes diff settings
set t_Co=256
set term=xterm-256color
let g:gruvbox_italic=0
colorscheme spacegray

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
let &showbreak = '↳ '
set showbreak=\ \
set breakindent
set breakindentopt=sbr

" mouse
set ttymouse=xterm2
set mouse=a

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace. Don't do it for unite windows or readonly files
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Disable highlighting lines over 128 symbols
set synmaxcol=128

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
set noeol

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
set textwidth=80
set autoindent
set wrap

" Gui options
set guioptions-=r
set guioptions-=L
set guioptions-=e
set guioptions-=T
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Whitspace
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END
autocmd BufWritePre * :%s/\s\+$//e

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader and localleader key to comma
let mapleader = "\<Space>"

:imap jk <Esc>
:imap jj <Esc>

" Fast indent command
  nnoremap > >gv
  nnoremap < <gv

inoremap <C-/> //

" Toggle Folding {{{
set foldmethod=marker
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

" Ctrl+s GUI
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Open the .vimrc in a new tab
nmap <leader>e :vsp $MYVIMRC<CR>

" Ag
nnoremap <leader>a :Ag
nmap <C-f> :Ag <c-r>=expand("<cword>")<cr><cr>

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Ctrlp

" Ctrlp
let g:ctrlp_show_hidden=1
nnoremap <C-b> :CtrlPBuffer<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\(node_modules|bower)$',
  \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor -f -U -g ""'

" Airline
let g:airline_powerline_fonts = 1

" ============================================================================
" fzf
" " ============================================================================
"
" ----------------------------------------------------------------------------
" Open files
" ----------------------------------------------------------------------------
nnoremap <silent> <Leader><Leader> :FZF -m<CR>
"
" " Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'tmux_height': '40%',
\   'sink':        'botright split' })<CR>
" "
" " Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'tmux_width': winwidth('.') / 2,
\   'sink':       'vertical botright split' })<CR>



"===============================================================================
" Unite
"===============================================================================
let g:unite_source_rec_max_cache_files=5000

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-group --no-color'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_search_word_highlight = 1
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '.idea',
      \ '\.git/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ '.jpg', '.png', '.svg', '.mp3',
      \ ], '\|'))

call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'prompt': '> ',
  \   'winheight': 10,
  \   'direction': 'botright',
\ })
" nnoremap <C-p> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<CR>
nnoremap <CR> :Unite line<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction


"===============================================================================
" KeyboardLayoutSwitcher
"===============================================================================

let g:kls_defaultInputSourceIndex = 0

" ==========================================
" NERDTree & Vimfiles
" =========================================

nnoremap <silent><leader>k :VimFiler -split -horizontal<CR>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_tree_indentation=2
let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '┄'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
call vimfiler#custom#profile('default', 'context', {
\   'explorer' : 1,
\   'safe': 0
\ })
let g:vimfiler_force_overwrite_statusline=0

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'

let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

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

" Indentline
let g:indentLine_enabled = 0

" From
" http://vim.wikia.com/wiki/Preserve_missing_end-of-line_at_end_of_text_files
"
" Preserve noeol (missing trailing eol) when saving file. In order
" to do this we need to temporarily 'set binary' for the duration of
" file writing, and for DOS line endings, add the CRs manually.
" For Mac line endings, also must join everything to one line since it doesn't
" use a LF character anywhere and 'binary' writes everything as if it were Unix.

" This works because 'eol' is set properly no matter what file format is used,
" even if it is only used when 'binary' is set.

augroup automatic_noeol {{{
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END

function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction

function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction }}}