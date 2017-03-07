" load pathogen
execute pathogen#infect()

" preference key remappings
let mapleader = "\<Space>"
"remap escape and reset insert mode
inoremap jk <ESC>

" general settings
filetype plugin on
filetype plugin indent on
syntax on
set nocompatible
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><Space> :noh<cr>

""set spell spelllang=en_us
set encoding=utf-8


"Coming Home To Vim Stuff
nnoremap <leader>a :Ack

" set default preferences
set number
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" Set hidden chars toggle
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Set new tab leader keys
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Set other leader keys
nnoremap <leader><S-E> :Explore<CR>

" Set quick vimrc access
nmap <leader>ve :tabe $MYVIMRC<CR>
nmap <leader>vs :source $MYVIMRC<CR>

" Set theme defaults for terminal and macvim
if has('gui_running')
    colors zenburn
    set guifont=Consolas:h14
else
    set background=dark
    let g:solarized_contrast="high"
    colorscheme solarized
    set antialias
endif

highlight NonText guifg=#468bba
highlight SpecialKey guifg=#468bba

" Keymaps for ctrlp plugin
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Keymaps for snipMate plugin
imap <C-Tab> <Plug>snipMateNextOrTrigger
smap <C-Tab> <plug>snipMateNextOrTrigger
vmap <C-Tab> <plug>snipMateNextOrTrigger

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" YCM config https://github.com/Valloric/YouCompleteMe/issues/2197
" vim compiles with only python2 support
let g:ycm_server_python_interpreter='python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python-Mode settings
let g:pymode_folding = 0

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
