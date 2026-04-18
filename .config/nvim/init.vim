set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " Set relative number
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax enable               " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

" Allows re-use of the same window for different files
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Keep indent on linebreak
set breakindent

" Display cursor pistion on the last line of the screen or in the status
" line of a window
set ruler

" Asks to confirm if you want to leave without saving instead of error
set confirm

" Set the command window height to 2
set cmdheight=2

" Set leader
let mapleader = ","

" Key remaps
:imap jj <Esc>
:imap <C-j> <C-r>" 
noremap <leader>l :nohlsearch<CR>
 
" Vimtex
let g:vimtex_view_method = 'zathura'

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" ToggleTerm
noremap <leader>t :NvimTreeToggle<cr>
noremap <leader>ft :NvimTreeFindFile<cr>

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" Prettier config
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0



let g:python_host_prog = '/sbin/python'
let g:python3_host_prog = '/sbin/python3'

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" PLUGINS
call plug#begin()
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}
Plug 'tpope/vim-surround'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'github/copilot.vim'

Plug 'hiphish/rainbow-delimiters.nvim'

Plug 'esensar/nvim-dev-container'
call plug#end()

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
	indent = { 
		enable = true
	}
  }
EOF

let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
require("toggleterm").setup{
    open_mapping = [[<leader><leader>]]
}
require("nvim-tree").setup()

require('rainbow-delimiters.setup').setup()
EOF

colorscheme catppuccin

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
endfunction

let g:mkdp_browserfunc = 'OpenMarkdownPreview'
