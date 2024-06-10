" Enable Syntax highlighting
syntax on

" Enable Mouse
set mouse=a

" Enable line numbers
set number
set relativenumber
set ruler
set signcolumn=yes

" Enable Auto indent
set autoindent
set expandtab

" Search and auto read setup 
set autoread
set ignorecase
set hlsearch
set smartcase
set showmatch
set cmdheight=2

" Disable's backups
set nobackup
set nowb
set noswapfile


"Set's Smart tab
set smarttab
set softtabstop=4
set shiftwidth=4
set ai
set si
set wrap

" Enable Backspace
set backspace=indent,eol,start


" Disable bell sounds 
set noerrorbells visualbell t_vb=

" Hide Buffers
set hidden

call plug#begin()
" Static Plugins
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'

Plug 'ajmwagar/vim-deus'
"Plug 'wadackel/vim-dogrun' 
let g:lightline = { 'colorscheme': 'deus'}

filetype plugin indent on

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Nerd Tree plugins
Plug 'Xuyuanp/nerdtree-git-plugin'

"Git change log plugin
Plug 'mhinz/vim-signify'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'udalov/kotlin-vim'


call plug#end()

" Set lightline status
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
let mapleader=","

" Set theme
"set background=dark
set termguicolors
colorscheme deus 
hi Normal guibg=NONE ctermbg=NONE

" coc keymap
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gi <Plug>(coc-implementation)
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Reformat keymap
nnoremap <C-l> gg=G
nmap <C-k> :NERDTreeToggle<CR>


" Set spell check
map <leader>ss :setlocal spell!<cr>

nmap <leader>cs :let @/ = ""<CR>

nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Functions 

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction




