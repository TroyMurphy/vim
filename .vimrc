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
set nobackup
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set colorcolumn=80
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set ttimeoutlen=50

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

nnoremap <leader><S-E> :Texplore .<CR>
" Bubble text up
nmap <leader>k ddkP
nmap <leader>j ddp
" Bubble multiple lines
vmap <leader>k xkP`[V`]
vmap <leader>j xp`[V`]


" Set quick vimrc access
nmap <leader>ve :tabe $MYVIMRC<CR>
nmap <leader>vs :source $MYVIMRC<CR>


" Set theme defaults for terminal and macvim
if has('gui_running')
    "
    " colors zenburn
    colorscheme solarized
    set background=dark
    set guifont=Consolas:h14
    set antialias
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
smap <C-Tab> <Plug>snipMateNextOrTrigger
vmap <C-Tab> <Plug>snipMateNextOrTrigger

" Keymaps for Tsuquyomi
inoremap <C-Space> <C-x><C-o>
nnoremap <leader>o :TsuImport<CR>
nnoremap <F3> :TsuDefinition<CR>

" Syntastic settings
set statusline+=%#warningmg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }


" Airline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline Symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Python-Mode settings
let g:pymode_folding = 0

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" functions
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
