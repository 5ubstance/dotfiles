" Pathogen ------------------------------------------------------------ {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" }}}

" Basic Options ------------------------------------------------------- {{{
set nocompatible
syntax enable
set number
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set encoding=utf8
set term=xterm-256color
filetype plugin indent on
" }}}

" Lifesaver ----------------------------------------------------------- {{{
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif
" }}}

" Graphic Options ------------------------------------------------------- {{{
"colorscheme wombat
colorscheme molokai
"colorscheme codeschool
"colorscheme zenburn
"let base16colorspace=256
let g:rehash256 = 1
set background=dark
highlight LineNr ctermfg=grey "ctermbg=white
" }}}

" Other Options ------------------------------------------------------- {{{
set smarttab
set shiftwidth=2
set laststatus=2
set autoindent
set smartindent
set whichwrap+=<,>,[,]
set backspace=indent,eol,start
" }}}

" quick shortcut to paste without the indenting
set pastetoggle=<F10>
cmap w!! w !sudo tee > /dev/null %

" copy/paste integration
set clipboard=unnamed

" plugin options
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
