" Plugins {{{
  call plug#begin('~/.nvim/plugged')

  " Search
  Plug 'rking/ag.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'

  " File browsing
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'vimlab/split-term.vim'
  Plug 'Shougo/denite.nvim'

  Plug 'editorconfig/editorconfig-vim'

  " Working with Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'jreybert/vimagit'
  Plug 'chrisbra/vim-diff-enhanced'

  " Code syntax
  Plug 'http://github.com/hail2u/vim-css3-syntax.git'
  Plug 'JulesWang/css.vim'
  Plug 'stephenway/postcss.vim'
  Plug 'othree/csscomplete.vim'
  Plug 'wavded/vim-stylus' , {'for': 'stylus'}
  Plug 'othree/html5.vim'
  Plug 'StanAngeloff/php.vim', {'for': 'php'}
  Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
  Plug 'digitaltoad/vim-pug', {'for': 'pug'}
  Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
  Plug 'tpope/vim-rails', {'for': 'ruby'}

  Plug 'neomake/neomake'

  " javascript
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'guileen/vim-node-dict'
  Plug 'moll/vim-node'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'gavocanov/vim-js-indent'
  Plug 'elzr/vim-json'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " Working with code
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'osyo-manga/vim-over'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rstacruz/vim-closer'
  Plug 'tpope/vim-repeat'
  Plug 'Valloric/MatchTagAlways'
  Plug 'tpope/vim-sleuth'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-commentary'

  " Color themes
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'rakr/vim-one'
  Plug 'ayu-theme/ayu-vim'

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ervandew/supertab'

  " Autocomplete
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/context_filetype.vim'
  " Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

  Plug 'vim-scripts/auto_autoread.vim'

" Add plugins to &runtimepath
call plug#end()

" }}}

" General settings {{{

filetype plugin indent on
syntax enable

" General settings
syntax on
set clipboard+=unnamedplus
set completeopt=longest,menuone,preview
set complete=.,k,t,i,d " t allows completing on tags, but that takes waaay too long
set ttyfast
set lazyredraw
set number

set timeout
set ttimeout
set timeoutlen=300
set ttimeoutlen=0

set splitright
set splitbelow
set cursorline
set history=1000
set autoread
set autowriteall
set mouse=a
set scrolloff=10
set scrolljump=3
set hidden
set backspace=start,indent,eol
set eol
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set noshowmatch
set showcmd
set vb
set t_vb=
set laststatus=2
set termencoding=utf-8
set fileencodings=utf8,cp1251
set fileformat=unix
set ffs=unix,dos,mac
set nobackup
set nowritebackup
set noswapfile
set tabstop=2
set shiftwidth=2
set formatoptions=c,q,r,t
set textwidth=80
set smarttab
set expandtab
set autoindent
set copyindent
set preserveindent
set smartindent
set wrap
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
let &showbreak = '↳ '
set showbreak=↪
set breakindent
set breakindentopt=sbr

if exists('&inccommand')
  set inccommand=split
endif

" Explicitly set encoding to utf-8
if !has('nvim')
  set encoding=utf-8
endif

" Statusline
set statusline=\%t\ %m
" set statusline+=\ \ %y
" set statusline+=\ \ %3.3(%c%)\ %3.9(%l/%L%)
" set statusline+=\ \ %{&fileencoding}

set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Colors
set termguicolors
set background=dark
let g:one_allow_italics = 1
let ayucolor="mirage"
colorscheme ayu

" Russian keymap support
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" }}}

"  Mappings {{{
let mapleader = "\<Space>"

" This maps control+n to exit terminal mode.
if has('nvim')
  :tnoremap <C-n> <C-\><C-n>
endif

" No need for ex mode
nnoremap Q <nop>

" No recording macros
map q <Nop>

" Better command
nnoremap ; :

:imap jk <Esc>
:imap jj <Esc>

" Fast indent command
xnoremap < <gv
xnoremap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

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

" Insert blank lines without going into Insert mode
nmap t o<ESC>k
nmap T O<ESC>j

" Open the .vimrc in a new tab
nmap <leader>e :vsp $MYVIMRC<CR>

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Visual linewise up and down by default
noremap j gj
noremap k gk

" Make Y/yy consistent with D/dd and C/cc
nnoremap yy Y
nnoremap Y y$

" No more accidentally showing up command window (Use C-f to show it)
map q: :q

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Incsearch fuzzy
map /  <Plug>(incsearch-forward)
map ? <Plug>(incsearch-fuzzy-/)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Open vertical term
nnoremap <leader>\ :VTerm<CR>
nnoremap § :Term<CR>

if has('nvim')
  tmap § :<Esc>:q<CR>
endif

" }}}

" Plugins {{{

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Supertab
let g:SuperTabLongestHighlight = 1
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" fugitive bindings
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>d :Gvdiff<CR>

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jsx' : 1,
    \}

" Multi Cursors
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" Ctrlsf don't ask confirmation
let g:ctrlsf_confirm_save=0

" Emmet
let g:user_emmet_install_global=0
let g:user_emmet_expandabbr_key='<C-e>'
imap <expr> <C-e> emmet#expandAbbrIntelligent("\<C-e>")
autocmd FileType html,css,tpl,stylus EmmetInstall

" Use deoplete.
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#enable_camel_case=1
let g:deoplete#enable_smart_case=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length=1
let g:deoplete#disable_auto_complete=0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']

" Tern js
let g:tern_request_timeout = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum =0  " This do disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" Open Ranger
let g:ranger_map_keys=0
map - :Ranger<CR>

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']

" Ultisnips
let g:UltiSnipsEditSplit="vertical"

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files <CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <Leader>C :Colors<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

" Ag
nnoremap <leader>a :Ag <CR>
nmap <C-f> :Ag <c-r>=expand("<cword>")<cr><cr>

nnoremap <leader>l :Rg <CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep('rg -i -s -w '.shellescape(<q-args>), 0, <bang>0)

" Automatically clean trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Autocomplete plugins slow down multiple cursors plugin
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction

" Called once only when the  selection is canceled (default <Esc>)
function! Multiple_cursors_after()
   let b:deoplete_disable_auto_complete = 0
endfunction

" Word delimiters -/_/__
function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc

" }}}

" Autogroups {{{

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Close NERDTree if there is no opened files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neomake
autocmd! BufWritePost * Neomake

" AutoReload .vimrc
augroup reload_vimrc
    autocmd!
    au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif
augroup END

autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

augroup omnifunc
  autocmd!

  autocmd FileType css,stylus,sass setlocal omnifunc=csscomplete#CompleteCSS
augroup end

au BufRead,BufNewFile *.jade set filetype=pug
au BufRead,BufNewFile *.tpl set filetype=html

augroup mm_buf_cmds
 " clear commands before resetting
  autocmd!
  " make sure `complete` works as expected for CSS class names without
  " messing with motions (eg. '.foo-bar__baz') and we make sure all
  " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
  autocmd InsertEnter,BufLeave * :silent call KeywordsAll()
  autocmd InsertLeave,BufEnter * :silent call KeywordsBasic()

  " yes, we need to duplicate it on VimEnter for some weird reason
  autocmd VimEnter * nnoremap * :silent call KeywordsAll()<CR> *
  autocmd VimEnter * nnoremap # :silent call KeywordsAll()<CR> #
augroup END

" }}}
