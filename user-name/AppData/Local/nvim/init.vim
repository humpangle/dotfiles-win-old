language en_US
set fileformat=unix

if has("gui_running")
  "so $VIMRUNTIME/mswin.vim
endif

" noremap <C-V> <C-V>

" Set <leader> key to <Space>
nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader=","

" SETTINGS
" Always show in tree view
let g:netrw_liststyle = 3
" Open file by default in new tab
" let g:netrw_browse_split = 3

let g:markdown_fenced_languages = [
  \ 'html',
  \ 'python',
  \ 'bash=sh',
  \ 'lua',
  \ 'vim',
  \ 'help',
  \ 'javascript',
  \ 'typescript',
  \ 'css',
  \ 'dart',
\]

syntax enable
" turn on detection for ftplugin/<filetype.vim>,indent/<filetype>.vim
filetype plugin on

" Many plugins require update time shorter than default of 4000ms
set updatetime=100
set hidden " close unsaved buffer with 'q' without needing 'q!'
set tabstop=2
set softtabstop=2
set expandtab " converts tabs to white space
set shiftwidth=2 " default indent = 2 spaces
set encoding=utf8
set cc=80  " column width
set incsearch    " Incremental search, search as you type
set ignorecase   " Make searching case insensitive
set smartcase    " ... unless the query has capital letters
set gdefault     " Use 'g' flag by default with :s/foo/bar/.
set hlsearch
" set nohlsearch

" Tab Splits
set splitbelow
set splitright
set mouse=a

set completeopt=menuone,noinsert,noselect

" I disabled both because they were distracting and slow (according to docs)
set cursorline " highlight cursor positions

" Spell check
set spelllang=en
" set spell
" ~/.config/nvim/spell/en.utf-8.add
set spellfile=~/.config/nvim/spell/en.utf-8.add

set foldmethod=indent
set foldnestmax=10
" don't fold by default when opening a file.
set nofoldenable
set foldlevel=2

" reload a file if it is changed from outside vim
set autoread
set noswapfile
set undofile
set undodir=$HOME/.vim/undodir/

" LINE NUMBERING
set number " always show line numbers
" set relativenumber " set relative numbering as default
set relativenumber

" format paragraphs/lines to 80 chars
nnoremap <Leader>pp gqap
xnoremap <Leader>pp gqa

" better code indentations in visual mode.
vnoremap < <gv
vnoremap > >gv
" yank / Copy and paste from system clipboard (Might require xclip install)
vmap <Leader>Y "+y
vmap <Leader>x "+x
nmap <Leader>x "+x
nmap <Leader>P "+P
vmap <Leader>P "+P

" SEARCH AND REPLACE
" remove highlight from search term
nnoremap <leader>nh :noh<CR>
" replace in entire file
nnoremap <leader>rr :%s///g
nnoremap <leader>rc :%s///gc

"""""""""""""""""""""""""""""""""""""
" START EASY MOTION
"""""""""""""""""""""""""""""""""""""
" let g:EasyMotion_smartcase = 1
"""""""""""""""""""""""""""""""""""""
" END EASY MOTION
"""""""""""""""""""""""""""""""""""""

augroup MyMiscGroup
  " highlight yank
  " :h lua-highlight
  au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

call plug#begin('~\AppData\Local\nvim\autoload')
  Plug 'tpope/vim-surround'
  Plug 'nelstrom/vim-visual-star-search'

  if !exists('g:vscode')
    Plug 'lifepillar/vim-solarized8'
    " A number of useful motions for the quickfix list, pasting and more.
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/lightline.vim'
    Plug 'sbdchd/neoformat'
    Plug 'easymotion/vim-easymotion'
    Plug 'windwp/nvim-autopairs'
    " Quickly toggle maximaize a tab
    Plug 'szw/vim-maximizer'
    Plug 'vim-scripts/AutoComplPop'
  else
    Plug 'asvetliakov/vim-easymotion', { 'as': 'vim-easymotion-vscode' }
  endif
call plug#end()

if !exists('g:vscode')
  so ~\AppData\Local\nvim\regular.vim
else
  so ~\AppData\Local\nvim\vscode.vim
endif
