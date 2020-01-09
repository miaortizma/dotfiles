" General
set number " Show line numbers
set linebreak " Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix
set textwidth=80 "Line wrap (number of cols)
set cursorline " Highlight current line
set hlsearch " Highlight matches
set showmatch "
set incsearch " Search as characters are entered
set mouse=a " Use mouse in all modes
set errorbells " Beep or flash screen on errors
set visualbell " Use visual bell
set list listchars=tab:>\ ,trail:-,eol:$

" Advanced
set autochdir " current file is pwd
set backspace=indent,eol,start

syntax on " Enable Syntax processing

set smartindent autoindent cindent
" Tabs
set expandtab " Tabs are spaces
set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

let mapleader=","

" Don't press escape
inoremap jk <esc>
inoremap kj <esc>
noremap ; :
" turn off search highlight ,<space>
nnoremap <leader><space> :nohlsearch<CR>
" NERDTreeToggle
nnoremap <leader>n :NERDTreeToggle<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Clipboard
set clipboard=unnamedplus

" Sessions 
au VimLeave * mksession! ~/.vim/sessions/%:t.session
au VimLeave * wviminfo! ~/.vim/sessions/%:t.viminfo
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin("~/.config/nvim/plugged")
" Plugins
" Essentials
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
" Javascript and Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" FuzzySearch
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim' 
" ALE
Plug 'dense-analysis/ale'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
"let g:ale_fix_on_save=true

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" AutoComplete
" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'morhetz/gruvbox'
let g:gruvbox_termcolors=256
set background=dark " Setting light mode
set termguicolors

" Initialize plugin system
call plug#end()
filetype plugin indent on

colorscheme gruvbox " Colorscheme

" FORMATTERS

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType typescript.tsx setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


nnoremap <F5> mzgggqG`z



" GNVIM

if has("gui_running")
  set guifont=Fira\ Code\ Medium:h10
endif
