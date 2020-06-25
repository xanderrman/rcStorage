

"jj rebound to escape
"if you're here for vscode it looks like this:
""vim.insertModeKeyBindings": [
"        {
"            "before": ["j", "j"],
"            "after": ["<Esc>"]
"        }
"    ]
inoremap jj <esc>
"
set background=dark
set t_Co=256

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

"
set showmode

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

