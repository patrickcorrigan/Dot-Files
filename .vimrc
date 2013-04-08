" Patrick Corrigan's VIMRC
" Last modified Sunday March 17th 2013

" ================ General =================================
set t_Co=256
set modelines=0
set nocompatible 
set backspace=2
set hidden


" ================ Search  =================================

" ================ Backups =================================
set backupdir=~/.vimfiles/backup
set directory=~/.vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" ================ Status ==================================
set relativenumber "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd

" ================ Syntax Highlighting =====================
syntax on
filetype plugin on

" ================ Tabs ====================================
set expandtab 
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" ================ Pathogen ================================
execute pathogen#infect()

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:ctrlp_custom_ignore = {
    \ 'dir':  'Library',
\ }

" ================ Colour Scheme ===========================
set background=light
colorscheme solarized

" ================ Leader Commands =========================
let mapleader = ","
nnoremap <Leader>t :tabnew %<CR>
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>c :!javac %<CR>
nnoremap <Leader>r :!java %<CR>
nnoremap <Leader>rs :!rspec %<CR>
