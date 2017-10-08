"let s:tabwidth=4     "variable for tab, shift, etc widths

syntax enable        "enable syntax highlighting

set background=dark
set tabstop=4        "number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4    "number of spaces in tab when editing
set expandtab        "tabs are spaces
set number           "show line numbers
set showcmd          "show command in bottom bar
set wildmenu         "visual autocomplete for command menu
set showmatch        "highlight matching brackets/parens
set incsearch        "search as characters are entered
set hlsearch         "highlight matches
set visualbell       "use visual bell instead of beeping
"set mouse=a           "enable mouse use
" :highlight ColorColumn ctermbg=blue guibg=blue
" set colorcolumn=80   "put a line at column 80 

"turn off search highlight, bound to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

"jk rebound to escape
inoremap jj <esc>

"rebindings for control v and control c to copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
