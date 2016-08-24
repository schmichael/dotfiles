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
