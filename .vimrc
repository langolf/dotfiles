call plug#begin('~/.nvim/plugged')

" Search
Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'unblevable/quick-scope'

" File browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'cloudhead/neovim-fuzzy'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'

Plug 'rbgrouleff/bclose.vim'
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
Plug 'StanAngeloff/php.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug', {'for': 'pug'}

Plug 'neomake/neomake'

" javascript
Plug 'guileen/vim-node-dict'
Plug 'moll/vim-node'
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'gavocanov/vim-js-indent'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --cache-min Infinity --loglevel http -g tern' }
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'neovim/node-host', { 'do': 'npm install --cache-min Infinity --loglevel http' }

" Working with code
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'osyo-manga/vim-over'
Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-oblique' | Plug 'junegunn/vim-pseudocl'
Plug 'easymotion/vim-easymotion'
" Plug 'Yggdroot/indentLine'
" Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-sleuth'

" Color themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'vimlab/split-term.vim'

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}

Plug 'vim-scripts/auto_autoread.vim'

" Plug 'justinmk/vim-sneak'

" For text objects
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'wellle/targets.vim'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on
syntax enable

" General settings
syntax on
set clipboard+=unnamedplus
set ttyfast
set nolazyredraw
set number

set timeout
set ttimeout
set timeoutlen=300
set ttimeoutlen=0
" set notimeout


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
set nosmartindent
set wrap

set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
let &showbreak = '↳ '
set showbreak=↪
set breakindent
set breakindentopt=sbr

" Explicitly set encoding to utf-8
if !has('nvim')
  set encoding=utf-8
endif

" Use old regexp engine for faster syntax highlight
set re=1

" Statusline
set statusline=\%t\ %m
" set statusline+=\ \ %y
" set statusline+=\ \ %3.3(%c%)\ %3.9(%l/%L%)
" set statusline+=\ \ %{&fileencoding}

set wildmode=full

" Colors
set termguicolors
set background=dark
let g:deepspace_italics = 1
let g:indentLine_char = '│'
colorscheme one

" Set filetype
set suffixesadd+=.rb,.jade,.styl,.sass,.js

" Russian keymap support
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Leader Key Mappings
" Map leader and localleader key to comma
let mapleader = "\<Space>"

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>

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
xnoremap <  <gv
xnoremap >  >gv

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
map  <C-/>  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Incsearch fuzzy
map /  <Plug>(incsearch-forward)
" map / <Plug>(incsearch-fuzzy-/)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F']
let g:qs_first_occurrence_highlight_color = '#afff5f'
let g:qs_second_occurrence_highlight_color = '#5fffff'
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81
nmap <leader>q <plug>(QuickScopeToggle)

" Easymotion
nmap <Leader>m <Plug>(easymotion-s)
omap <Leader>m <Plug>(easymotion-bd-t)
vmap <Leader>m <Plug>(easymotion-bd-t)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" React JSX
let g:jsx_ext_required=0 " Allow JSX in normal JS files

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Open vertical term
nnoremap <leader>\ :VTerm<CR>
nnoremap § :Term<CR>

if has('nvim')
  tmap § :<Esc>:q<CR>
endif

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

" " Emmet
let g:user_emmet_install_global=0
autocmd FileType html,jade,jsx,css,javascript.jsx,stylus,sass,scss EmmetInstall

" Use deoplete.
" let g:python_host_prog='/usr/bin/python'
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#enable_camel_case=1
let g:deoplete#enable_smart_case=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length=2
let g:deoplete#disable_auto_complete=0
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']

" Autocomplete plugins slow down multiple cursors plugin
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
   let b:deoplete_disable_auto_complete = 0
endfunction

augroup omnifunc
  autocmd!

  autocmd FileType css,stylus,sass setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd FileType html,jsx,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
augroup end

au BufRead,BufNewFile *.jade set filetype=pug
" au BufRead,BufNewFile *.sss set filetype=sass

" Tern js
let g:tern_request_timeout = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum =0  " This do disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Open Ranger
let g:ranger_map_keys=0
" map <leader>x :Ranger<CR>
map - :Ranger<CR>

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Close NERDTree if there is no opened files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']

" Neomake
autocmd! BufWritePost * Neomake

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

map <leader>m :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" FZY
nnoremap <C-l> :FuzzyOpen<CR>

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF -m<CR>
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

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" AutoReload .vimrc
augroup reload_vimrc
    autocmd!
    au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif
augroup END

" Word delimiters -/_/__
function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc

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
