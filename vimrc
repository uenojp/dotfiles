" Encoding
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
" Disable beep sound
set vb t_vb=
" Show line numbers
set number
" Tab as 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Tabs to spaces
set expandtab
" Incremental search
set incsearch
" Highlight search results
set hlsearch
" Use system clipboard
set clipboard=unnamedplus
" Go to next line with h, l key
set whichwrap+=h,l
" Keep 5 lines above/below current cursor
set scrolloff=5
" Auto-indent on newline
set autoindent
" Auto-indent on wrapped lines
if exists('+breakindent')
    set breakindent
endif

" Mapping
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap Y y$

