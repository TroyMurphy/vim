set nocompatible
set spell spelllang=en_us
set encoding=utf-8

let mapleader = "\<Space>"

inoremap jk <ESC>
nnoremap <leader>f lz=
vnoremap . :norm.<cr>

filetype plugin on
filetype plugin indent on

syntax on

execute pathogen#infect()
