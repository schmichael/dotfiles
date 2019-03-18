set background=dark
set number

call plug#begin()
" Greatest go plugin ever
Plug 'fatih/vim-go', { 'tag': '*' }
" fatih does it again
"Plug 'fatih/vim-hclfmt'
" don't use it much, handy for :Gbrowse
Plug 'tpope/vim-fugitive'
" needed for :Gbrowse
Plug 'tpope/vim-rhubarb'
" upgrade from ack to ripgrep
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
" IDEish but handy for big files
Plug 'majutsushi/tagbar'
" Greatest file finder ever
Plug 'kien/ctrlp.vim'
" Nice way to see changes and revert hunks
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" ctags
let g:gutentags_ctags_tagfile="tags"
let g:gutentags_ctags_exclude=["vendor/*", "ui/*", "demo/*", "terraform/*"]
map <C-k> :CtrlPTag<Enter>

" tagbar
nmap <Leader>tt :TagbarToggle<CR>

" nerdtree
nmap <Leader>nn :NERDTreeToggle<CR>

" go
nmap <Leader>gb :GoBuild<CR>
nmap <Leader>gt :GoTest -c<CR>
" Make Lgi a shortcut to !go install instead of GoInstall as the shell
" command will execute in cwd which is usually the project root.
nmap <leader>gi :GoInstall github.com/hashicorp/nomad<CR>
let g:go_fmt_command = "goimports"
autocmd FileType go setlocal foldmethod=syntax foldlevel=999 foldminlines=3
autocmd FileType go normal   zR

" Always draw status line
set laststatus=2

" Display more stuffs in the status line
set statusline=%F%m%r%h%w%=[%{&ff}/%Y]\ %5.5l\/%L\ \ %3.3c

" case insensitive searches if no uppercase characters
set smartcase

" set terminal title
set title
set titlestring=%f%(\ [%M]%)

" Skip files I never want to open
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Spaces in bash files
autocmd FileType sh setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" Spaces in html files
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" Spellcheck in docs
autocmd FileType markdown setlocal spell
set spellfile=$HOME/.vim/spellfile.utf-8.add

" Faster ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
