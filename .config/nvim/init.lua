vim.cmd("colorscheme molokai")
vim.g.molokai_original = 1

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.backspace = "2"
vim.opt.showmatch = true
vim.opt.virtualedit = "onemore"
vim.opt.laststatus = 2
vim.opt.colorcolumn = "80"

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- share clipboard with other tmux/terminal panes
vim.opt.clipboard = "unnamed"

vim.cmd([[
" plugins
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'tpope/vim-fugitive'

let g:lsp_highlight_references_enabled = 1

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_signs_warning = {'text': '!'}

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ 'for': [
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'typescript',
      \ 'typescriptreact',
      \ 'css',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'lua',
      \ 'python',
      \ 'html' ] }

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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
command! -nargs=* Files call fzf#run(
      \ { 'source': 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
      \ , 'sink'  : 'e'
      \ , 'down'  : '40%'
      \ })

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
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" find/navigate
nmap <leader>[ :Buffer<cr>
nmap <leader>] :Files<cr>
nmap <leader>\ :Rg<cr>

" language server
nmap <buffer> <leader>d :LspDeclaration<cr>
nmap <buffer> <leader>t :LspHover<cr>
nmap <buffer> <leader>r :LspRename<cr>
nmap <buffer> <leader>f :LspDocumentFormat<cr>
" include code folding, code navigation
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
]])
