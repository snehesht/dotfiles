
" Settings
set number
syntax on

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set modeline


" Set WildMenu
set wildmenu

" Set Path - Search for file in subdirs of subdirs 
set path+=**

" Start Vim-Plug
call plug#begin('~/.vim/plugged')

" Solarized Color Scheme
" Plug 'altercation/vim-colors-solarized'
" Solarized 
" Plug 'romainl/flattened'

" Python AutoCompletion
" Plug 'Valloric/YouCompleteMe'

" Base16 Color Scheme
" Plug 'chriskempson/base16-vim'

" Nerdtree 
Plug 'scrooloose/nerdtree'

" Vim-venigar
Plug 'tpope/vim-vinegar'

"CodiVim
Plug 'metakirby5/codi.vim'

" Thesarus 
Plug 'beloglazov/vim-online-thesaurus', { 'on': ['Thesaurus', 'OnlineThesaurusCurrentWord'] }

" Comments
" gcc in normal/visual mode to toggle comments
Plug 'tpope/vim-commentary'

" Plug 'scrooloose/nerdcommenter'

" Git Wrapper
Plug 'tpope/vim-fugitive'

" Git-gutter
" Disabled by default, to enable :GitGutterToggle
Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 0

" Distraction free writing 
Plug 'junegunn/goyo.vim'

" Quoting Parenthesizing plugin
Plug 'tpope/vim-surround'

" Python syntax highlighting, pep8 
Plug 'klen/python-mode'

" Tmux plugin for vim
Plug 'tmux-plugins/vim-tmux'

" Seamless navigation between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'



" CSS
Plug 'ap/vim-css-color'

" End Vim-Plug
call plug#end()

" Color Scheme
colorscheme gruvbox
set background=dark
let g:gruvbox_bold=0

set antialias
set nocompatible

" -- Display
set title " Update the title of your window or your terminal
set number " Display line numbers
set ruler " Display cursor position
set wrap " Wrap lines when they are too long
set scrolloff=3 " Display at least 3 lines around you cursor

" (for scrolling)
" set guioptions=T " Enable the toolbar

" -- Search
set ignorecase " Ignore case when searching
set smartcase " If there is an uppercase in your search term

" search case sensitive again
set incsearch " Highlight search results when typing
set hlsearch " Highlight search results

" -- Beep
" set visualbell " Prevent Vim from beeping
" set noerrorbells " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching to another buffer
set hidden

filetype on
filetype plugin on
filetype indent on

set list                   " Show non-printable characters.
" set listchars=trail:.,tab:>-,extends:>,precedes:<,nbsp:¬
if has('multi_byte') && &encoding ==# 'utf-8'
   let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
   let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

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

" StatusLine
set statusline=%!StatusLine()

function! StatusLine()
    let statusline = ""
    " Filename (F -> full, f -> relative)
    let statusline .= "%f"
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " File format and type
    let statusline .= "(%{&ff}%(\/%Y%))"
    " Left/right separator
    let statusline .= "%="
    " Line & column
    let statusline .= "(%l,%c%V) "
    " Character under cursor (decimal)
    let statusline .= "%03.3b "
    " Character under cursor (hexadecimal)
    let statusline .= "0x%02.2B "
    " File progress
    let statusline .= "| %P/%L"
    return statusline
endfunction

set splitright

" Python

" set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly


