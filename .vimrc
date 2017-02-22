" load pathogen
execute pathogen#infect()

" general settings
filetype plugin on
filetype plugin indent on
syntax on
set nocompatible
""set spell spelllang=en_us
set encoding=utf-8

" preference key remappings
let mapleader = "\<Space>"
inoremap jk <ESC>

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

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
