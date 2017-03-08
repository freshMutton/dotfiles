colorscheme molokai
syntax enable

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab

set hidden " dont auto-save tabs when switching"

set autoread " reload file if changed outside of vim automagically

set noswapfile " we don't need no swap file

set number
set cursorline
filetype indent on
set wildmenu
set wildignorecase
set backspace=2 " sane backspacing
set showmatch " highlight matching parentheses
set virtualedit=onemore " sane cursor
set laststatus=2 " show airline
set colorcolumn=80

set incsearch
set hlsearch
set ignorecase
set smartcase

" share clipboard with other tmux/terminal panes
set clipboard=unnamed

" keybindings
let mapleader=' ' "<Leader> key

" clear search highlighting with Escape
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" tab/buffer
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>q :bp <BAR> bd #<cr>

" loc list
nmap <leader>lo :lopen<cr>
nmap <leader>lc :lclose<cr>

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

set rtp+="~/.opam/4.02.3/share/ocp-indent/vim"

nmap <leader>t :MerlinTypeOf<cr>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#syntastic#enabled=1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime=1
let g:gitgutter_eager=1

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_prompt='» '
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_auto_select=0
let g:unite_source_rec_async_command=['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
let g:unite_source_grep_command=['ag', '--vimgrep']

nmap <leader>] :Unite -auto-resize buffer -buffer-name=file file_rec/async:!<cr>
nmap <leader>\ :Unite grep:!<cr>

Plug 'Raimondi/delimitMate'

Plug 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_aggregate_errors=1
let g:syntastic_ocaml_checkers=["merlin"]
let g:syntastic_javascript_checkers=["eslint", "flow"]
let g:syntastic_javascript_flow_exe="flow"
let g:syntastic_javascript_eslint_exec="eslint_d"

Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'
Plug 'othree/jspc.vim'
Plug 'pangloss/vim-javascript'

let g:javascript_plugin_flow=1

Plug 'digitaltoad/vim-pug'

Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>/ :NERDTreeToggle<cr>

Plug 'flowtype/vim-flow'

Plug 'elmcast/elm-vim'

call plug#end()

"calling unite functions after plug#end()
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
