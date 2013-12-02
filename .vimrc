" Patrick Corrigan's VIMRC
" Last modified Sunday March 17th 2013

" ================ General =====================================================
set t_Co=256
set modelines=0
set nocompatible 
set backspace=2
set hidden


" ================ Wrapping  ===================================================
set textwidth=80
set colorcolumn=+1

" ================" Search======================================================
set foldmethod=syntax
" ================ Search  =================================

" ================ Backups =================================
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" ================ Status ==================================
set number "Line numbers
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
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'wikitopian/hardmode'
Bundle 'Valloric/YouCompleteMe'
" ================ Colour Scheme ===========================
set background=dark
colorscheme solarized

" ================ Leader Commands =========================
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
