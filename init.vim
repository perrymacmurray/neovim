" Vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/plugins")

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

" ALE: disable cc linter (this syntax doesn't work in lua)
let g:ale_linters_ignore = {
\ 'c': ['cc'],
\ 'cpp': ['cc'],
\}

lua require("config")

" Load Qualcomm configs (if present)
if filereadable('/usr2/pmacmurr/.config/nvim/qualcomm.vim')
  source /usr2/pmacmurr/.config/nvim/qualcomm.vim
endif

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
