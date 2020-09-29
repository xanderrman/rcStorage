

"jk rebound to escape
"if you're here for vscode it looks like this:
""vim.insertModeKeyBindings": [
"        {
"            "before": ["j", "k"],
"            "after": ["<Esc>"]
"        }
"    ]
inoremap jk <esc>

" Misc color/syntax stuff
set background=dark
set t_Co=256

" janky fix for vims goofy syntax enable vs on situation
if !exists("g:syntax_on")
    syntax enable
endif
set foldmethod=syntax
set foldnestmax=1
set foldlevel=99

" use the system clipboard by default when yanking
set clipboard=unnamedplus

" f2 toggles in and out of paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Tell me what mode I'm in (insert vs normal)
set showmode

" Disable all sorts of bells and visual alerts
set visualbell t_vb=
set novisualbell

filetype plugin indent on
set autoindent

" Allow backspace / delete in insert mode
set backspace=start,eol,indent

" Turn on search term highlighting
set hlsearch

" Print representations of trailing spaces, tabs and end-of-line
highlight SpecialKey ctermfg=DarkGrey
highlight NonText    ctermfg=DarkGrey
"using tpope's version of listchars for now
"set listchars=tab:\\-,trail:.,eol:$
set list
"set nolist number " for demo only!

" Show line numbers, and use as little space
" as possible on the left margin for displaying them.
set number
set numberwidth=1

"""   ;cp - Set for COPY mode (turn off non-printing chars)
map <leader>cp :set nonumber<CR>:set nolist<CR>

"""   ;pc - Opposite of ;cp - turns on non-printing chars
map <leader>pc :set number<CR>:set list<CR>





" Stuff yanked from tpope/vim-sensible
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" vim:set ft=vim et sw=2:
