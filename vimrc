set nocompatible
filetype off " Required by vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jnwhiteh/vim-golang'
Bundle 'majutsushi/tagbar'
Bundle 'saltstack/salt-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'elzr/vim-json'

syntax on              " Syntax highlighting
filetype plugin indent on " Filetype magic

" <cargo-cult>
set autowrite          " write before commands like :next and :make
set background=dark    " dark background is only background
set backupdir=~/.vim/backups,.
set cmdheight=2
set directory=~/tmp/vimswap,.
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
" </cargo-cult>

" Whitespace characters for ':set list'
set listchars=tab:\┊\ ,eol:¶,trail:💣

" Command (:) tab completion
set wildmode=longest,list,full
set wildignore+=.git,.hg,.svn,.bzr,*.pyo,*.pyc,.DS_Store,*.egg-info
set wildmenu

" ctrlp
let g:ctrlp_map = '<c-p>'
" Use current directory as root for Go projects
"au FileType go let g:ctrlp_working_path_mode = ''
let g:ctrlp_working_path_mode = ''

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Tags
source ~/.vim/autotag.vim

" NERDTree
nmap <F7> :NERDTreeToggle<CR>

" C
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
au FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Go
au FileType go setlocal tabstop=2 shiftwidth=2 noexpandtab foldmethod=syntax
"au FileType go au BufWritePre <buffer> Fmt " Too slow

" Markdown
au BufRead,BufNewFile *.md setlocal filetype=markdown
au FileType markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Python
au FileType python setlocal foldmethod=indent
au FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:syntastic_python_flake8_args = "--ignore=E128,E261,E225,E401"

" Protos
au! BufRead,BufNewFile *.proto setfiletype proto

" Ruby
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Shell (bash)
au BufRead bash-rc-* setlocal filetype=sh

" HTML
au FileType html setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Javascript / JSON
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Map :lnext & lprev to [l and ]l
nmap [l :lnext<CR>
nmap ]l :lprev<CR>

" Get out of insert mode more easily
imap jj <ESC>
imap kk <ESC>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1

" ctrlp
let g:ctrlp_clear_cache_on_exit = 0

" Maven / POM
au BufRead pom.xml setlocal tabstop=2 shiftwidth=2 expandtab

" Finally source a local file if it exists
source ~/.vimrc_local
