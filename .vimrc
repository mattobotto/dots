set nocompatible
set encoding=utf-8
set hidden

" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" call plugins
call plug#begin()
Plug 'yegappan/lsp'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" file type detection for auto-indentation
if has ("autocmd")
  filetype indent plugin on
endif

" syntax highlighting
syntax on
augroup jsonhl
  au!
  au BufNewFile,BufRead *.json set ft=json syntax=javascript
augroup end

" do not use spaces for tabs in makefiles
augroup maketabs
  au!
  au FileType make setlocal noexpandtab
augroup end

" automatically resize splits when window is resized
augroup autoresize
  au!
  au VimResized * wincmd =
augroup end

" fzf
let g:fzf_layout = { 'down': '40%' }

" lsp servers
" let lspServers = [#{
"       \ name: '',
"       \ filetype: '',
"       \ path: '',
"       \ args: ['']
"       \ }]
let lspOpts = #{ autoHighlightDiags: v:true }
au User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
      \ name: 'bashls',
      \ filetype: 'sh',
      \ path: '/usr/bin/bash-language-server',
      \ args: ['start']
      \ }]

let lspServers = [#{
      \ name: 'clangd',
      \ filetype: ['c', 'cpp'],
      \ path: '/usr/bin/clangd',
      \ args: ['--background-index', '--clang-tidy']
      \ }]

let lspServers = [#{
      \ name: 'cssls',
      \ filetype: 'css',
      \ path: '/usr/bin/vscode-css-languageserver',
      \ args: ['--stdio']
      \ }]

let lspServers = [#{
      \ name: 'htmlls',
      \ filetype: 'html',
      \ path: '/usr/bin/vscode-html-languageserver',
      \ args: ['--stdio']
      \ }]

let lspServers = [#{
      \ name: 'luals',
      \ filetype: 'lua',
      \ path: '/usr/bin/lua-language-server',
      \ args: ['']
      \ }]

let lspServers = [#{
      \ name: 'pyright',
      \ filetype: 'python',
      \ path: '/usr/bin/pyright',
      \ args: ['--stdio'],
      \ workspaceConfig: #{
      \   python: #{
      \     pythonPath: '/usr/bin/python3.13'
      \ }}
      \ }]

let lspServers = [#{
      \ name: 'tsserver',
      \ filetype: ['javascript', 'typescript'],
      \ path: '/usr/bin/typescript-language-server',
      \ args: ['--stdio']
      \ }]

au User LspSetup call LspAddServer(lspServers)

" ui
set number relativenumber
set numberwidth=4
set cursorline
set showcmd
set showmode
set ruler
set signcolumn=yes
set showmatch
set scrolloff=3
set belloff=all
set cmdheight=1
set colorcolumn=80
set termwinsize=15x0

" statusline
set laststatus=2
set stl=\ [%n]%f%r%m\ %{FugitiveStatusline()}\ %=%c\ 

" text
set copyindent
set smarttab
set autoindent
set smartindent
set nowrap
set textwidth=0
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" enable omnicompletion
set ofu=syntaxcomplete#Complete

" command-line
set wildignorecase
set wildmenu
set wildmode=list:longest,list:full

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

" keymaps
let mapleader=" "
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Files 
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>. :bnext<cr> 
nnoremap <leader>, :bprev<cr>
nnoremap <leader>] 10<c-w>+<cr>
nnoremap <leader>[ 10<c-w>-<cr>
nnoremap <leader>t :bo term<cr>
nnoremap <leader>h :noh<cr>

" theme
set termguicolors
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized8
hi Normal guibg=NONE ctermbg=NONE
