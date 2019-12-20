"syntax enable        "enable syntax highlighting
"
"set background=dark
"set tabstop=4        "number of visual spaces per TAB
"set shiftwidth=4
"set softtabstop=4    "number of spaces in tab when editing
"set expandtab        "tabs are spaces
"set number           "show line numbers
"set showcmd          "show command in bottom bar
"set wildmenu         "visual autocomplete for command menu
"set showmatch        "highlight matching brackets/parens
"set incsearch        "search as characters are entered
"set hlsearch         "highlight matches
""set mouse=a           "enable mouse use
"" :highlight ColorColumn ctermbg=blue guibg=blue
"" set colorcolumn=80   "put a line at column 80 

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'mattn/emmet-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"tabs are bad mkay
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

""jk rebound to escape
inoremap jj <esc>
"
set background=dark
set t_Co=256
"
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
"set showmode

"########### FILETYPE STUFF ############
filetype plugin indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"######################################

" handle looooong lines in YAML files
set maxmempattern=8192

" Disable all sorts of bells and visual alerts
set visualbell t_vb=
set novisualbell

" Autoindent, I love you
filetype indent on
set autoindent

" Allow backspace / delete in insert mode
set backspace=start,eol,indent

" Turn on search term highlighting
set hlsearch

" Print representations of trailing spaces, tabs and end-of-line
highlight SpecialKey ctermfg=DarkGrey
highlight NonText    ctermfg=DarkGrey
set listchars=tab:\\-,trail:.,eol:$
set list
"set nolist number " for demo only!

" Show line numbers, and use as little space
" as possible on the left margin for displaying them.
set number
set numberwidth=1

" Turn on syntax higlighting on a dark background.
" Some update must have turned this off, jrh - 2008-11-28
syntax on

" Turn on marker foldmethod, to make things easier
set foldmethod=marker


"""   ;cp - Set for COPY mode (turn off non-printing chars)
map <leader>cp :set nonumber<CR>:set nolist<CR>

"""   ;pc - Opposite of ;cp - turns on non-printing chars
map <leader>pc :set number<CR>:set list<CR>

