" Default settings

"############### TODO ##############
"
" [ ]   [Mapping] Swap splits
" [ ]   Python Support
" [x]   Intendation Fix
" [ ]   Enter character in End of Line after the last char not before
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
" set autoread

" Enable syntax
set syntax=on

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set textwidth=80
set smarttab
set expandtab

" Auto Indent
set ai

" Smart Indetn
set si

" Wrap lines
set wrap
" set wrapmargin=80


" Statusline
" set modeline

" Autocompletion menu
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor

"Always show current position
set ruler

" Color Column ( Ruler guide after 80 chars )
" set colorcolumn=80
" set cc=80

" Height of the command bar
set cmdheight=1

" Echo typed keys
set showcmd

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

" Line folding
set foldmethod=marker
set foldlevel=0

" Folding format
" Section Name {{{
" set number "This will be folded
"
" set colorscheme to gruvbox
"
" }}}

" Add a bit extra margin to the left
" set foldcolumn=1

" Colorscheme
colorscheme gruvbox
set background=dark
set antialias

" Visual indication of trail chars, tabs etc.
set list   " Show non-printable characters.
set listchars=trail:.,tab:..,extends:>,precedes:<,nbsp:¬

" Put all temporary files under the same directory.
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



" Always split right on vsplit
set splitright

" Always split below on split
set splitbelow


"######################################
" Plugins							  #
"######################################

call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'scrooloose/nerdtree'
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" NerdTreeTabs to sync nerdtree between tabs
Plug 'jistr/vim-nerdtree-tabs'

" Seamless tmux-vim navigation
Plug 'christoomey/vim-tmux-navigator'


" Buffer Explorer
Plug 'jlanzarotta/bufexplorer'

" Git for vim
Plug 'tpope/vim-fugitive'


" Comment lines with vim-commentary
" gc in visual mode
" gcc in normal mode
Plug 'tpope/vim-commentary'

" Indentation
Plug 'yggdroot/indentline'
" let g:indentLine_setColors = 0
" Custom color
let g:indentLine_color_term = 242
let g:indentLine_char = '¦'


" Ctrl-P
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


" ACK - AG a.k.a The Silver Searcher ( grep alternative )
" Plug 'mileszs/ack.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='base16_colors'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '☲'

" Show just filename
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' Lines'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '[PASTE]'
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = 'Ξ'


" Python Support plugin
Plug 'davidhalter/jedi-vim'
" Auto initialize
let g:jedi#auto_initialization = 1
" disable auto prompt on .
let g:jedi#popup_on_dot = 0


call plug#end()


" #####################################
"  Keys							      #
" #####################################
" <space> == SPACE_BAR
" <cr> == ENTER

" Leader Key
let mapleader = ","
let g:mapleader = ","

" Map <ESC> to jj
inoremap jj <ESC>

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


" Python
"
" ~/.vim/ftplugin/python.vim
autocmd FileType python



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
