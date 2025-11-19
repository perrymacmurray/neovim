" Vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Utility
Plug 'ggandor/leap.nvim'
Plug 'f-person/git-blame.nvim'

" Style
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'

call plug#end()

runtime *-extras/init-before.vim " Initialization of extras that MUST take place immediately after plugin loading

" ALE: disable cc linter (this syntax doesn't work in lua)
let g:ale_linters_ignore = {
\ 'c': ['cc'],
\ 'cpp': ['cc'],
\ 'python' : ['flake8'],
\}

lua require("config")

runtime *-extras/init.vim " Normal initialization of extras, after requires (extras should load their own lua)

" Various settings
set nocompatible
set showmatch
set ignorecase
set mouse=a
set hlsearch
set autoindent
set number " line numbers
set wildmode=longest,list " bash-like tab completions
filetype plugin indent on
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
