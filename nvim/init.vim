set nocompatible
set clipboard+=unnamedplus
filetype plugin on

call plug#begin()

" add plugins here
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
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
Plug 'dhruvasagar/vim-table-mode'
Plug 'sainnhe/edge'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

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

" Move lines up or down
nnoremap <S-J> :m .+1<CR>==
nnoremap <S-K> :m .-2<CR>==
vnoremap <S-J> :m '>+1<CR>gv=gv
vnoremap <S-K> :m '<-2<CR>gv=gv

" navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-S-T> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-T> :tabnext<CR>

" Exit Terminal Mode with Escape
tnoremap <Esc> <C-\><C-n>

" FoxDot controls
"nnoremap <C-e> :StartFoxDot<CR>
"nnoremap <C-L> :FDRunLine<CR>
"nnoremap <C-B> :FDRunBlock<CR>
"nnoremap <C-H> :FDClearClock<CR>

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

set background=dark

" Sonokai config
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" Everforest config
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1

" Edge config
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_enable_italic_comment = 1

colorscheme edge

" Tidal Cycles target
let g:tidal_target = "terminal"


" CoC config
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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


