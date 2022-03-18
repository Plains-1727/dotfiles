set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add plugins here
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'vim-python/python-syntax'
Plugin 'itchyny/calendar.vim'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'sainnhe/everforest'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tidalcycles/vim-tidal'
Plugin 'sainnhe/sonokai'

" Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" enable trueguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set markdown file extension
let g:vim_markdown_auto_extension_ext = 'txt'

" enable syntax highlighting
syntax on

" always show status line
set laststatus=2

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" split on the right and below
set splitright
set splitbelow

" better command-line completion
set wildmenu

" show partial commands in the last line of the screen
set showcmd

" highlighting searches
set hlsearch

" clear search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" navigate through wrapped lines
nnoremap j gj
nnoremap k gk

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split navigations in built-in terminal
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" Display all highlighting groups for markdown
nnoremap <silent> <Leader>g :source $VIMRUNTIME/syntax/hitest.vim<CR>

" identify highlight group under cursor
nnoremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" show NERDTree
nnoremap <C-T> :NERDTreeToggle<CR>

" navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" when opening a new line an no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on
set autoindent

" instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" display line numbers
set number

" use spaces instead of tabs
set shiftwidth=4
set softtabstop=4
set expandtab

" set encoding
set encoding=utf-8

" set colorscheme
"colorscheme onehalfdark
"colorscheme sonokai

set background=dark

" Colorscheme settings for Sonokai
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" Colorscheme settings for everforest
let g:everforest_background = 'hard'

colorscheme sonokai

" PEP8 indentation and better auto-indentation for python files
" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" color bad whitespace red
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhiteSpace /\s\+$/

let python_highlight_all=1

" Target for tidal cycles plugin
let g:tidal_target = "terminal"

syntax on
