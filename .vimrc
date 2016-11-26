" Default settings

"############### TODO ##############
"
" [Mapping] Swap splits
" Python Support
" Intendation Fix
"
"
"


" Disable vi-compatability
set nocompatible

" Enable linenumbers
set number

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Enable syntax
set syntax=on

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Auto Indent
set ai

" Smart Indetn
set si

" Wrap lines
set wrap

" Statusline
" set modeline

" Autocompletion menu 
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set path+=**

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" set foldcolumn=1

" Colorscheme
colorscheme gruvbox
set background=dark
set antialias


"######################################
" Plugins							  #	
"######################################

call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'scrooloose/nerdtree'
" NerdTreeTabs to sync nerdtree between tabs
Plug 'jistr/vim-nerdtree-tabs'

" Seamless tmux-vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Comment lines with vim-commentary
" gc in visual mode
" gcc in normal mode
Plug 'tpope/vim-commentary'


" Ctrl-P
Plug 'kien/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" ACK - AG a.k.a The Silver Searcher ( grep alternative )
" Plug 'mileszs/ack.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='base16_eighties'
let g:airline#extensions#tabline#enabled = 1 
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '[PASTE]'
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = 'Ξ'



call plug#end()


" #####################################
"  Keys							      #
" #####################################
" <space> == SPACE_BAR
" <cr> == ENTER

" Leader Key
let mapleader = ","
let g:mapleader = ","

" Quick Save
nmap <leader>w :w!<cr>

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

" Buffers
" <leader>l --> next buffer
" <leader>h --> prev buffer
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" buffer close current --> <leader>bcc
map <leader>bcc :Bclose<cr>:tabclose<cr>gT
" buffers close all --> <leader>bca
map <leader>bca :bufdo bd<cr>
" Open new buffer
map <leader>n :e ~/buffer<cr>


" Search
map <leader>hl :nohl<cr>

" NERDTree Mapping
map <leader>t :NERDTreeToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>

" Helper Functions

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
