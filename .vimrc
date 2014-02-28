" Patrick Corrigan's VIMRC
" Last modified Sunday Feburary 16th 2014

" ================ General =====================================================
set mouse=c
set wildmenu
set t_Co=256
set modelines=0
set nocompatible
set backspace=2
set hidden
set shortmess+=I


" ================ Wrapping  ===================================================
set textwidth=80
set colorcolumn=+1
set cursorline
set cursorcolumn

" ================" Search======================================================
"set foldmethod=syntax
set ignorecase
set incsearch
set smartcase

" ================ Backups =====================================================
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" ================ Status ======================================================
set number "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd

" ================ Syntax Highlighting =========================================
filetype off
syntax enable
filetype plugin indent on

" ================ Tabs ========================================================
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" ================ Pathogen ====================================================
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'sandeepravi/refactor-rails.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'edkolev/tmuxline.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kbarrette/mediummode'
Bundle 'kchmck/vim-coffee-script'

" ================ Colour Scheme " =============================================
set background=dark
colorscheme zenburn

" ================ Leader Commands " ===========================================
let mapleader = ","
map <space> <leader>
nnoremap <Leader>c :!
nnoremap <Leader>u :e ~/todo<CR>
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>y "*Y
nnoremap <Leader>p "+p<CR>
nnoremap <Leader>P "+P<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>; :b #<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>d :colorscheme solarized<CR>:set background=light<CR>
nnoremap <Leader>n :colorscheme zenburn<CR>
nnoremap <Leader>rs :%s/\s\+$//<CR>

let g:airline_powerline_fonts=1
let g:ctrlp_by_filename=1
" let g:airline#extensions#tabline#enabled = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 12

if has("autocmd")
    " filetype indent on
endif
imap jf <Esc>
cmap jf <Esc>
" let g:EclimCompletionMethod = 'omnifunc'
imap <C-K> <Plug>snipMateNextOrTrigger
nnoremap <leader>t <Esc>:call ToggleHardMode()<CR>
nnoremap n nzzzv
nnoremap N Nzzzv


call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -start-insert file_rec/async:!<CR>
