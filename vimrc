colorscheme molokai
let g:molokai_original=1
let g:rehash256=1

filetype indent on
syntax enable

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set lazyredraw
set hidden
set autoread
set noswapfile
set number
set cursorline
set wildmenu
set wildignorecase
set backspace=2
set showmatch
set virtualedit=onemore
set laststatus=2
set colorcolumn=80

set incsearch
set hlsearch
set ignorecase
set smartcase

" share clipboard with other tmux/terminal panes
set clipboard=unnamed

" plugins
call plug#begin('~/.vim/plugged')
" editor features
Plug 'w0rp/ale'
let g:ale_fixers = {}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = "•"

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}

" don't show preview window
set completeopt-=preview

" close on completion
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tab completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#ale#enabled = 1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime=1
let g:gitgutter_eager=1

Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
command! -nargs=* Files call fzf#run(
\ { 'source': 'ag -l'
\ , 'sink'  : 'e'
\ , 'down'  : '40%' })

let g:fzf_colors =
\ { 'fg'      : ['fg', 'Normal']
\ , 'bg'      : ['bg', 'Normal']
\ , 'hl'      : ['fg', 'Comment']
\ , 'fg+'     : ['fg', 'CursorLine', 'CursorColumn', 'Normal']
\ , 'bg+'     : ['bg', 'CursorLine', 'CursorColumn']
\ , 'hl+'     : ['fg', 'Statement']
\ , 'info'    : ['fg', 'PreProc']
\ , 'prompt'  : ['fg', 'Conditional']
\ , 'pointer' : ['fg', 'Exception']
\ , 'marker'  : ['fg', 'Keyword']
\ , 'spinner' : ['fg', 'Label']
\ , 'header'  : ['fg', 'Comment'] }

" languages

" JavaScript
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs'
Plug 'steelsojka/deoplete-flow'
Plug 'mxw/vim-jsx'
Plug 'othree/jspc.vim'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:flow#autoclose = 1
let g:flow#timeout = 4

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"

" Scala
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
autocmd BufWritePost *.scala silent :EnTypeCheck
nmap <leader>d :EnDeclarationSplit v

call plug#end()

" keybindings
let mapleader=' ' "<Leader> key

" clear search highlighting with Escape
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" buffer
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>q :bp <BAR> bd #<cr>

" loc list
nmap <leader>lo :lopen<cr>
nmap <leader>lc :lclose<cr>


" tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" reindent
nmap <leader>f mzgg=G`z

" find/navigate
nmap <leader>[ :Buffer<cr>
nmap <leader>] :Files<cr>
nmap <leader>\ :Ag<cr>
nmap <leader>/ :NERDTreeToggle<cr>

autocmd FileType ocaml      nmap <buffer> <leader>d :MerlinLocate<cr>
autocmd FileType javascript nmap <buffer> <leader>d :TernDef<cr>
autocmd FileType scala      nmap <buffer> <leader>d :EnDeclaration<cr>

" type annotations
autocmd FileType ocaml      nmap <buffer> <leader>t :MerlinTypeOf<cr>
autocmd FileType javascript nmap <buffer> <leader>t :FlowType<cr>
autocmd FileType scala      nmap <buffer> <leader>t :EnType<cr>

" refactor
autocmd FileType ocaml      nmap <buffer> <leader>r :MerlinRename<cr>
autocmd FileType javascript nmap <buffer> <leader>r :TernRename<cr>
autocmd FileTYpe scala      nmap <buffer> <leader>r :EnRename<cr>
