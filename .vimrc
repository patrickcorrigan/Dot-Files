"  Patrick Corrigan's VIMRC
" Last modified Friday April 24th 2015
"

" ================ General " ==============================================={{{
set mouse=
set spelllang=en_gb
set wildmenu
set wildmode=list:longest,full
set modelines=0
set nocompatible
set backspace=2
set hidden
set shortmess+=I
set undodir=~/.vim/undo
set undofile
set list listchars=tab:»·,trail:·,extends:❯,precedes:❮
set showbreak=↪
set cm=blowfish
set t_Co=256
"}}}

" ================ Wrapping  ==============================================={{{
" set textwidth=79
set formatoptions+=t
" set colorcolumn=+1
set cursorline
set cursorcolumn
set nowrap
" :match ErrorMsg '\%>79v.\+'
"}}}

" ================" Search ================================================={{{
set ignorecase
set incsearch
set hlsearch
set smartcase

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap * *N

nnoremap mf ByW:e <crtl>-r "

"}}}

" ================ Backups ================================================={{{
set noswapfile
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
"}}}

" ================ Status =================================================={{{
set number "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd
"}}}

" ================ Syntax Highlighting ====================================={{{
filetype off
" syntax enable
filetype plugin indent on
"}}}

" ================ Tabs ===================================================={{{
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
"}}}

" ================ Vundle =================================================={{{

source ~/.vim/vimrc/vundle

"}}}

" ================ Plugin Configuration ===================================={{{
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:rspec_command = "! bundle exec rspec --no-color {spec}"
set wildignore+=*/dist/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip 




" Submodes

" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

" We're taking over the default <C-w> setting. Don't worry we'll do
" our best to put back the default functionality.
call submode#enter_with('window', 'n', '', '<C-w>')

" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')

" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
\           'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor
" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

" Old way, just in case.

" ================ Vim Wikki ==================================================
let wiki_1 = {}
let wiki_1.path = '~/documents/vimwiki'
let g:vimwiki_list = [wiki_1]
let NERDTreeShowBookmarks=1
let NERDTreeMapHelp='<f1>'

" ================ Ctrl-P =====================================================
" let g:ctrlp_by_filename=1

" ================ Airline ====================================================
 " let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts=1
" let g:ycm_auto_trigger = 0
" let g:airline_section_c .= '%{getcwd()}'

" ================ Eclim ======================================================
" let g:EclimCompletionMethod = 'omnifunc'

" ================ Unite ======================================================
let g:unite_winheight = 10
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])

call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)
let g:unite_source_file_rec_max_cache_files = 0

"}}}
let g:NERDTreeChDirMode=2

" ================ Colour Scheme " ========================================={{{
if has('gui_running')
    " if strftime("%H") < 17
    "   set background=light
    " else
    "   set background=dark
    " endif
    set background=light
    colorscheme base16-grayscale
else
    "let base16colorspace=256
    "colorscheme badwolf
    " syntax on
    set background=light
    colorscheme base16-grayscale
endif
"}}}

" ================ Key Remapping " ========================================={{{
source ~/.vim/vimrc/mappings

" ================ Miscellaneous" =============================================

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'



" ================ Leader Commands " ======================================={{{

source ~/.vim/vimrc/leader

" ================ Gui Options " ==========================================={{{

source ~/.vim/vimrc/gui_options
au VimResized * exe "normal! \<c-w>="


" }}}

" ================ In Testing " ============================================{{{

:command! -nargs=+ Calc :py print <args>
:py from math import *
:py from cmath import *

" ================ Vimscript functions " ==================================={{{

" ================ Alignment Columns " ==================================={{{
source ~/.vim/vimrc/alignment_columns

" ================ Highlight Word " ==================================={{{
source ~/.vim/vimrc/highlight_word

" ================ Modified Search Highlighting " ==================================={{{

hi Search guibg=peru guifg=wheat
hi IncSearch guibg=deepskyblue guifg=wheat
highlight Normal guifg=black
highlight Normal guibg=white

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

iabbrev @@    patrickcorrigan7@gmail.com

nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
