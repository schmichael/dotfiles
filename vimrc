call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'preservim/tagbar'
call plug#end()

" FZF for ctrlp / file search
nmap <C-P> :Files<CR>

" Dark mode
set background=dark

" Go
nmap <Leader>gb :GoBuild<CR>
nmap <Leader>gt :GoTest -c<CR>

" Tagbar
nmap <Leader>tt :TagbarToggle<CR>
