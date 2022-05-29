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
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap Y y$
nnoremap j gj
nnoremap k gk

" Install vim-plug and plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    \ >/dev/null 2>&1
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'easymotion/vim-easymotion'
" Disable default mapping
let g:EasyMotion_do_mapping = 0
" case-insensitive
let g:EasyMotion_smartcase = 1
" <Space>{char}
nmap <Space> <Plug>(easymotion-overwin-f)

Plug 'tomtom/tcomment_vim'
if !exists('g:tcomment_types')
	let g:tcomment_types = {}
endif
let g:tcomment_types['c'] = '// %s'

Plug 'dense-analysis/ale'
let g:ale_fixers = {
    \   'c': ['clang-format'],
    \   'cpp': ['clang-format'],
    \   'rust': ['rustfmt'],
    \ }
command R ALERename

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Go to definition in new tab
nmap gd :tab split<CR>:LspDefinition<CR>
command F LspDocumentFormat

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
syntax enable
set background=dark

call plug#end()

colorscheme solarized

