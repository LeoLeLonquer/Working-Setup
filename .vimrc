" Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/Vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'beigebrucewayne/Turtles'
Plugin 'jalvesaq/Nvim-R'
Plugin 'bitc/vim-bad-whitespace'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'davidhalter/jedi-vim'


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General
let mapleader = "," " first key for customization
let maplocalleader = ";" " what's the difference ?
set showcmd   " helps to show the command
set number    " Show line numbers
set linebreak    " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
set textwidth=100    " Line wrap (number of cols)
set showmatch    " Highlight matching brace
set visualbell    " Use visual bell (no beeping)

set hlsearch    " Highlight all search results
set smartcase    " Enable smart-case search
set incsearch    " Searches for strings incrementally
set magic       " for regex

set autoindent    " Auto-indent new lines
set shiftwidth=4    " Number of auto-indent spaces
set smartindent    " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4    " Number of spaces per Tab
set autoread        " detect changes from the outside
set so=4            "let some space when moving vertically
set foldcolumn=1    " let a margin on the teft

set cursorline " show a visual line under the cursor's current line
set encoding=utf-8

" Advanced
set ruler    " Show row and column ruler information

set undolevels=1000    " Number of undo levels
set backspace=indent,eol,start    " Backspace behaviour

set splitbelow "change vim default split
set splitright

au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1]) "coming back to normal mode, set the cursor in pos+1
								 " might be better to use a instead
								 " of i
" put two parenthesis when writing one

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i


" Map of keys
" Disable directions
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
nnoremap <C-J> <C-W><C-J> "to navigate between split panes
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/Library/Frameworks/Python.framework/Versions/3.3/bin/python3'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" NerdTree
" autocmd vimenter * NERDTree
map <leader>z :NERDTreeToggle <CR>

" Nerd Commenter
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments

" R config
au BufNewFile,BufRead *.r
    \let R_notmuxconf = 1|
    \let R_listmethods = 1|
    \let R_specialplot = 1|
    \let R_args_in_stline = 1|
    \let R_sttline_fmt = "%#Function#%fun%#Delimiter#(%#Normal#%args%#Delimiter#)"|
    \let R_nvim_wd = 1
" PYTHON CONFIG
" enable syntax highlighting
syntax enable

au BufNewFile,BufRead *.py
    \set tabstop=4  | " set tabs to have 4 spaces
    \set softtabstop=4 |
    \set shiftwidth=4| " when using the >> or << commands, shift lines by 4 spaces
    \set textwidth=79  |
    \set expandtab | " expand tabs into spaces
    \set autoindent| " indent when moving to the next line while writing code
    \set fileformat=unix




" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" enable all Python syntax highlighting features
let python_highlight_all = 1
syntax on



" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

" COLORS
set t_Co=256
let g:solarized_termcolors=256
set background=dark
" colorscheme zenburn
colorscheme solarized
