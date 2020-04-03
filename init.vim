" Basic visual stuff
set number " Show line numbers
set cursorline " Highlight current line
set hlsearch " Highlight matches
set showmatch " Match (){}[]
set list listchars=tab:>\ ,trail:-,eol:$"

" Hardcore mode, disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Tabs
set expandtab " Tabs are spaces
set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2

" Advanced / General Stuff
syntax on " Enable Syntax processing
set incsearch " Search as characters are entered
set autochdir " current file is pwd
set backspace=indent,eol,start " makes backspace work
set smartindent autoindent
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

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

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

set clipboard=unnamed

" Sessions 
au VimLeave * mksession! ~/.vim/sessions/%:t.session
au VimLeave * wviminfo! ~/.vim/sessions/%:t.viminfo
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

source /home/miaortizma/.config/nvim/plugins.vim

" Specify a directory for plugins
call plug#begin("~/.config/nvim/plugged")
" Essentials
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Javascript and Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" FuzzySearch
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim' 
" ALE
Plug 'dense-analysis/ale'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Autocomplete with Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
" Gruvbox
set background=light " Setting light mode
set termguicolors
colorscheme gruvbox " Colorscheme

" ALE
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


" FORMATTERS

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType typescript.tsx setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

nnoremap <F5> mzgggqG`z

" NERDTreeToggle
nnoremap <leader>n :NERDTreeToggle<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
