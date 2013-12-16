call pathogen#infect() " Load plugins via pathogen

syntax on              " Syntax highlighting
filetype plugin indent on " Filetype magic

set autowrite          " write before commands like :next and :make
set background=dark    " dark background is only background
set backupdir=~/.vim/backups,.
set cmdheight=2
set directory=~/.vim/swap,.
set equalalways        " split windows have equal size
set foldlevelstart=10  " start open
set ignorecase         " case insensitive searches
set laststatus=2
set modeline           " allow modelines
set mouse=a
set smartcase          " case insensitive searches if no uppercase characters
set statusline=%F%m%r%h%w%=[%{&ff}/%Y]\ %5.5l\/%L\ \ %3.3c
set title              " enable window titles
set titlestring=%f%(\ [%M]%)
set ttyfast
" Command (:) tab completion
set wildmode=longest,list,full
set wildignore+=.git,.hg,.svn,.bzr,*.pyo,*.pyc,.DS_Store,*.egg-info
set wildmenu

" C
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
au FileType c setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=syntax

" Python
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=indent
let g:syntastic_python_checker_args = "--ignore=E261,E225,E401"
let g:syntastic_check_on_open=1

" HTML
au FileType html setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 foldmethod=indent

" Markdown
au BufRead,BufNewFile *md set filetype=markdown
au FileType markdown setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=indent

" Map :lnext & lprev to [l and ]l
nmap [l :lnext<CR>
nmap ]l :lprev<CR>

" Get out of insert mode more easily
imap jj <ESC>
imap kk <ESC>

" ctrlp
let g:ctrlp_clear_cache_on_exit = 0

" Go!
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
