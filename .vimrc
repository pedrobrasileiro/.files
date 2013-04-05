call pathogen#infect()
set wildmenu
set encoding=utf-8
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

set autoindent     " Turn on auto-indent
set smartindent	   " Turn on intelligent auto-indent
set expandtab      " Space instead tabs
set tabstop=4      " tab pressed to space
set shiftwidth=4   " Defines 4 spaces as indent size

au BufRead,BufNewFile *.sass set filetype=css
au BufRead,BufNewFile *.tss set filetype=css

let g:Powerline_symbols = 'fancy'
 
colorscheme molokai
