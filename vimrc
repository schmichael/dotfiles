call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'preservim/tagbar'
Plug 'tpope/vim-vinegar'
call plug#end()

" Matthew Irish is a genius
let mapleader=' '

" FZF for ctrlp / file search
nmap <Leader><Leader> :Files<CR>

" Dark mode
set background=dark

" Go
nmap <Leader>gb :GoBuild<CR>
nmap <Leader>gt :GoTest -c<CR>

" Tagbar
nmap <Leader>tt :TagbarToggle<CR>
