" Description: Keymaps

" General
inoremap jk <Esc>
let mapleader = "'"

" Buffer
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>

" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Vim Config
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

" FZF

nnoremap <C-p> :GFiles<Cr>
nnoremap <silent><leader>l :Buffers<CR>
