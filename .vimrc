" Default settings

"############### TODO ##############
"



" Disable vi-compatability
set nocompatible

" Enable mouse support automatically and disable mouse scrolling while typing
if has('mouse')
    set mouse=a
    set mousehide
endif


" Default Encoding
scriptencoding utf-8

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
" set autoread

" Enable syntax
set syntax=on

" Enable linenumbers
set number
set relativenumber
" set numberwidth=3 " auto

" Indentation
" set spacing to use spaces, not tabs, 4 spaces per indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab


" 256 terminal colors to be supa pretty
set t_Co=256

" Smart Indentation
set ai
set si

" Wrap lines
set wrap
set textwidth=80
" set wrapmargin=80

" These are really nice options for handling text wrapping in comments
" see :help fo-table for what exactly they do
set formatoptions=qrn2tcoj

" smoother performance since we use modern terminals
set ttyfast

" Autocompletion menu
" Command <Tab> completion, list matches, then longest common part, then all.
set wildmenu
set wildmode=list:longest
" set wildmode=list:longest,full
" Ignore these folders
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/__pycache__/*

"Always show current position
set ruler

" Color Column ( Ruler guide after 80 chars )
" set colorcolumn=80
" set cc=80

" Height of the command bar
" set cmdheight=1

" Echo typed keys
set showcmd

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Search
" {{{
set path+=**

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

"}}}


" Don't redraw while executing macros (good performance config)
" set lazyredraw


" How many tenths of a second to blink when matching brackets
set mat=2

" Just 5 lines per scroll
set scrolljump=5

" Position cursor within top10 or bottom10 lines
set scrolloff=10

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Line folding
"  set foldenable " Auto fold enabled
set foldmethod=marker
set foldlevel=0
" Add a bit extra margin to the left
" set foldcolumn=1

" Colorscheme
" {{{ GruvBox & Tomorrow-Night
colorscheme snehesh
" set background=dark

" colorscheme one
" set background=light
set antialias
" let g:gruvbox_contrast_dark="hard"    " Changes dark mode contrasts. Possible values are soft, medium, and hard. Default is medium
" let g:gruvbox_contrast_light="hard"   " Changes light mode contrasts. Possible values are soft, medium, and hard. Default is medium
let g:gruvbox_italicize_comments=1    " Enables italics for comments
let g:gruvbox_italicize_strings=1
" }}}

" Visual indication of trail chars, tabs etc.
set list   " Show non-printable characters.
set listchars=trail:.,tab:..,extends:>,precedes:<,nbsp:¬

" Backup and Undo
" {{{ Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo ='100,n$HOME/.vim/files/info/viminfo
" }}}

" Always split right on vsplit
set splitright

" Always split below on split
set splitbelow


" {{{ Better Writing
" Automatically write a file when leaving a modified buffer
set autowrite

" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Allow for cursor beyond last character
set virtualedit=onemore

" Store a ton of history (default is 20)
set history=1000

" Spell checking on
" set spell
" }}}

" Save buffer whenever you lose focus
augroup beziAutoSave
    au!
    au FocusLost * :wa
augroup END

" Allow buffer switching without saving
set hidden

" MacVim & gVim
" {{{ MacVim
" MacVim settings
if has('gui_running')
  set guifont=SF\ Mono\ Medium\ Extra-Condensed\ 9
  set guioptions=egm
  set guitablabel=%t\ %M
  set background=light
  colorscheme one
endif
" }}}



"######################################
" Plugins							  #
"######################################

call plug#begin('~/.vim/plugged')

" Cursor
" {{{ Cursorword and Multiple Cursors
Plug 'itchyny/vim-cursorword'

Plug 'terryma/vim-multiple-cursors'

" }}}

" {{{ NerdTree
Plug 'scrooloose/nerdtree'
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" NerdTreeTabs to sync nerdtree between tabs
Plug 'jistr/vim-nerdtree-tabs'
" }}}

" {{{ Tmux
" Seamless tmux-vim navigation
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Buffers
" {{{ BufferExplorer and BufferLine

" Bufferline
" Plug 'bling/vim-bufferline'

" Buffer Explorer
Plug 'jlanzarotta/bufexplorer'
" }}}

" Git
" {{{ vim-fugitive
Plug 'tpope/vim-fugitive'
" }}}

" Startup Screen
" {{{ Startify
Plug 'mhinz/vim-startify'

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
" let g:startify_custom_header = s:filter_header(startify#fortune#cowsay())

" }}}

" Better Writing
" {{{ Goyo
Plug 'junegunn/goyo.vim'

" }}}

" Comments
" {{{ Comment lines with vim-commentary
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
" }}}

" Auto Indent setting based on file
" {{{ Auto tabspace, shiftwidth based on file
Plug 'tpope/vim-sleuth'
" }}}

" Brackets
" {{{ Surround brackets, quotes etc.
Plug 'tpope/vim-surround'
" }}}

" Indentation
" {{{ Indentline
Plug 'yggdroot/indentline'
" let g:indentLine_setColors = 0
" Custom color
" let g:indentLine_color_term = 233
" let g:indentLine_char = '¦'
" let g:indentLine_char = '|'
" }}}

" SuperTab : Get <Tab> functionality back
" {{{ SuperTab
" Perform <Tab> completions in  INSERT MODE
" <c-p> == <Tab>
" <c-n> == <S-Tab>
Plug 'ervandew/supertab'
" }}}

" Ctrl-P FuzzyFile finder
" {{{ Ctrl-P
Plug 'kien/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" let g:ctrlp_show_hidden = 0
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" }}}

" Statusline
" LightLine Config {{{
Plug 'itchyny/lightline.vim'

" Always show status line
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? "\u25c8" : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? "{READ ONLY} \u21C9" : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ""  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}

" Tabs
" {{{ tabline and Taboo
Plug 'mkitt/tabline.vim'
hi TabLine      ctermfg=088  ctermbg=235     cterm=NONE
hi TabLineFill  ctermfg=088  ctermbg=235     cterm=NONE
hi TabLineSel   ctermfg=236  ctermbg=228     cterm=NONE

" Taboo - Easy tab renaming
Plug 'gcmt/taboo.vim'
let g:taboo_modified_tab_flag = "\u25C8"
let g:taboo_renamed_tab_format = " %N: %l %m "
let g:taboo_tab_format = " %N: %f %m "

"}}}

" Code Linting
" {{{ Asyc Linter
" Plug 'w0rp/ale'

" }}}

" Colorschemes
" {{{
Plug 'dracula/vim'
Plug 'jacoborus/tender.vim'
Plug 'nikitavoloboev/vim-monokai-night'

" }}}

" Python Support plugin
" {{{ jedi-vim
Plug 'davidhalter/jedi-vim'
" Auto initialize
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#force_py_version = 3
let g:jedi#smart_auto_mappings = 0
" }}}

" JavaScript
" {{{
" JavaScript Indentation and Code Highlighting
Plug 'pangloss/vim-javascript'

" Flow - Static type checker
" Plug 'flowtype/vim-flow'

" JavaScript parameter completion
" Plug 'othree/jspc.vim'
" }}}

" Markdown
" {{{

Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<leader>p'
let vim_markdown_preview_browser='Google Chrome'

" }}}


" Autocompletion
" {{{
" NeoComplete
" Plug 'Shougo/neocomplete.vim'


" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Tmux Autocomplete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'wellle/tmux-complete.vim'
let g:tmuxcomplete#trigger = ''

" }}}
" Fuzzy File Finder
" {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" }}}

" HTML & SASS/CSS
" {{{
" Emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_mode='in'  "enable all functions, which is equal to
" Enable emmet just for HTML/CSS
" let g:user_emmet_install_global = 0

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_expandabbr_key='`'

" CloseTag Closing
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.jsx"

" SASS Plugin
Plug 'cakebaker/scss-syntax.vim'
" }}}

" Ledger
" {{{
Plug 'ledger/vim-ledger'
" }}}
" Database
" {{{
Plug 'tpope/vim-db'
"
" }}}
" Unused Plugins
" {{{

" ACK - AG a.k.a The Silver Searcher ( grep alternative )
" Plug 'mileszs/ack.vim'

" Json
" Plug 'elzr/vim-json'

" Code Formatter
" Plug 'Chiel92/vim-autoformat'

" Linting
" Plug 'w0rp/ale'
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['flake8'],
" \ }
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" }}}

call plug#end()


" #####################################
"  Keys							      #
" #####################################
" <space> == SPACE_BAR
" <cr> == ENTER

" Leader Key
let mapleader = ','
let g:mapleader = ','

" Map <ESC> to jj
inoremap jj <ESC>
vnoremap jj <ESC>

" Quick Save
nmap <leader>w :w!<cr>
inoremap <leader>w <ESC>:w!<cr>

" Paste Mode toggel
map <leader>p :setl paste!<cr>

" Tabs
" <leader>> --> Next Tab
" <leader>< --> Prev Tab
map <leader>> :tabnext<cr>
map <leader>< :tabprev<cr>
map <leader>tc :tabclose<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>tn :tabnew<cr>

" Toggle Tabline
map <leader>th :set showtabline=0<cr>

" Bind <leader>NUMBER to Tabs
nnoremap <silent> <leader>1 :tabn1<cr>
nnoremap <silent> <leader>2 :tabn2<cr>
nnoremap <silent> <leader>3 :tabn3<cr>
nnoremap <silent> <leader>4 :tabn4<cr>
nnoremap <silent> <leader>5 :tabn5<cr>
nnoremap <silent> <leader>6 :tabn6<cr>
nnoremap <silent> <leader>7 :tabn7<cr>
nnoremap <silent> <leader>8 :tabn8<cr>

" Buffers
" <leader>l --> next buffer
" <leader>h --> prev buffer
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" map <leader>, :bprevious<cr>
" map <leader>. :bnext<cr>


" buffer close current --> <leader>bcc
map <leader>bcc :Bclose<cr>:tabclose<cr>gT
" buffers close all --> <leader>bca
map <leader>bca :bufdo bd<cr>
" Open new buffer
map <leader>n :e ~/.buffer<cr>


" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Search
map <leader>hl :nohl<cr>

" NERDTree Mapping
map <leader>t :NERDTreeToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>

" make the bracket move easier to hit (move from opening to closing braces, etc)
" TODO: see if I actually use this
noremap <tab> %
vnoremap <tab> %

" Disable Arrow key navigation
" Todo: Write a function to toggle this.
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>


" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <ESC> <nop>

" ###############################################
"                                               #
"           Filetype Settings                   #
"                                               #
" ###############################################

" Delete buffer on vim exit
autocmd VimLeave * %bdelete

" Auto-trim whitespace on save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * %s/\s\+$//e

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Emmet
autocmd FileType html,css EmmetInstall

" Python
" ~/.vim/ftplugin/python.vim
autocmd FileType python setlocal completeopt-=preview


" ###############################################
"                                               #
"           Helper Functions                    #
"                                               #
" ###############################################

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
        buffer #
   else
        bnext
   endif

   if bufnr("%") == l:currentBufNum
        new
   endif

   if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" toggle between number and relativenumber
command! ToggleLineNumbers call ToggleNumber()
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
