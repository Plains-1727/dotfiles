set nocompatible
set clipboard+=unnamedplus
filetype plugin on

call plug#begin('~/.vim/plugged')

" add plugins here
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'sainnhe/sonokai'
Plug 'tidalcycles/vim-tidal'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'liuchengxu/vim-clap'
Plug 'mcchrish/nnn.vim'
Plug 'suzanje/foxdot-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'

call plug#end()

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

" show NERDTree
nnoremap <C-T> :NERDTreeToggle<CR>

" show NnnExplorer
nnoremap <C-N> :NnnExplorer<CR>

" navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Exit Terminal Mode with Escape
tnoremap <Esc> <C-\><C-n>

" FoxDot controls
nnoremap <C-e> :StartFoxDot<CR>
nnoremap <C-L> :FDRunLine<CR>
nnoremap <C-B> :FDRunBlock<CR>
nnoremap <C-H> :FDClearClock<CR>

"when opening a new line an no filetype-specific indenting is enabled, keep
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

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" set encoding
set encoding=utf-8

set background=dark

" Sonokai config
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" Everforest config
let g:everforest_background = 'hard'

colorscheme sonokai

" Tidal Cycles target
let g:tidal_target = "terminal"

" coc (code completion) config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <F5> :CocCommand powershell.evaluateLine<CR>
vmap <F5> :CocCommand powershell.evaluateSelection<CR>
nmap <F8> :CocCommand powershell.execute<CR>

" lualine config

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END


