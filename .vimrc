"load pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
filetype plugin on
syntax on

" preference key remappings
inoremap jk <ESC>
let mapleader = "\<Space>"

" general settings
set guifont=Inconsolata\ for\ Powerline:h14
set nocompatible
set noswapfile
set nobackup
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest,list
set visualbell
set nocursorline
set colorcolumn=80
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set ttimeoutlen=50
if $COLORTERM == 'gnome-terminal'
    set t_Co="256"
endif

set incsearch
set showmatch
set hlsearch
nnoremap <leader><Space> :noh<cr>
nnoremap <leader>n //<CR>

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

" Open sibling buffer quickly
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
    set macmeta
    colorscheme solarized
    set background=dark
    set antialias
    set cursorline
   " hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue ctermfg=white
else
    colorscheme solarized
    set background=dark
    set antialias
endif

highlight NonText guifg=#468bba
highlight SpecialKey guifg=#468bba

" Keymaps for ctrlp plugin
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='rc'
let g:ctrlp_by_filename=0
let g:ctrlp_max_depth=40

let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules\|git\|coverage',
    \ 'file': '\v\.(js)$',
    \ }


" Keymaps for Tsuquyomi
inoremap <C-Space> <C-x><C-o>
nnoremap <leader>o :TsuImport<CR>
nnoremap <F3> :TsuDefinition<CR>
let g:tsuquyomi_shortest_import_path = 1

nnoremap <leader>ss1 :mks! ~/jsys_session1.vim<CR>
nnoremap <leader>sl1 :so ~/jsys_session1.vim<CR>
nnoremap <leader>ss2 :mks! ~/jsys_session2.vim<CR>
nnoremap <leader>sl2 :so ~/jsys_session2.vim<CR>

" Syntastic settings
set statusline+=%#warningmg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }


" Airline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"UltiSnipsConfig
let g:UltiSnipsSnippetsDir = '~/.vim/ultiSnips/'
let g:UltiSnipsEditSplit = 'vertical'

" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Python-Mode settings
set foldmethod=indent
set foldlevel=99
let g:pymode_folding = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_completion=1
let g:vimpy_prompt_resolve = 1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""Python Mode
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_python = 'python3'
nnoremap <C-c>l :PymodeLintAuto<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
