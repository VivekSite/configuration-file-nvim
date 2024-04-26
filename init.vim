" Enable type file detection
filetype on

" Enable plugins and laod plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn Syntax highlighting on
syntax on

" Highlight current line
:highlight Cursor cterm=bold ctermbg=black

" Enable mouse
set mouse=a

" Set undo file for storing undo history
" Press u in normal mode to undo
set undofile

" Set Tab Width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Enable highlight search
set hlsearch

" Ignore capital letters during search
set ignorecase

" This wil allow to search specifically for capital letterss
set smartcase

" Wrap text
set wrap

" Encoding
set encoding=utf-8

" Show line numbers
set number

" Plugins -------------------------{{{

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/mg979/vim-visual-multi'  " Multicursor using ctrl+n | ctrl+d

call plug#end()

" }}}


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



