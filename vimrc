set background=dark

call plug#begin()
" Greatest go plugin ever
Plug 'fatih/vim-go'
" don't use it much, handy for :Gbrowse
Plug 'tpope/vim-fugitive'
" it's ok. just :Ack <something>
Plug 'mileszs/ack.vim'
" don't use it much, but handy on big repos
Plug 'scrooloose/nerdtree'
" IDEish but handy for big files
Plug 'majutsushi/tagbar'
" Greatest file finder ever
Plug 'kien/ctrlp.vim'
" Nice way to see changes and revert hunks
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-hashicorp-tools'
call plug#end()

" tagbar
nmap <Leader>tt :TagbarToggle<CR>

" Always draw status line
set laststatus=2

" Display more stuffs in the status line
set statusline=%F%m%r%h%w%=[%{&ff}/%Y]\ %5.5l\/%L\ \ %3.3c

" case insensitive searches if no uppercase characters
set smartcase

" set terminal title
set title
set titlestring=%f%(\ [%M]%)
