" Tries to determine the filetype for auto-indenting
" Also loads filetype specific plugins
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Allows re-use of the same window for different files
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Keep indent same on file-types without specific indenting
set autoindent

" Keep indent on linebreak
set breakindent

" Display cursor pistion on the last line of the screen or in the status
" line of a window
set ruler

" Asks to confirm if you want to leave without saving instead of error
set confirm

" Set the command window height to 2
set cmdheight=2

" Display line number on the left
set number

" Highlight matching brackets [{()}]
set showmatch

" Tabs will appear as 4 spaces
set tabstop=4

" Match tabs with indents   
set shiftwidth=4

" Key remaps
:imap jj <Esc>
:imap <C-j> <C-r>" 

" LeaderF config
" popup window
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"

" Set relative number
set relativenumber

" Set clipboard
set clipboard=unnamedplus

" Set leader
let mapleader = " "

" PLUGINS
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
EOF
