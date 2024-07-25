set nocompatible 	" Disable compatibllity to old-time vi
set showmatch 		" Show matching brackets
set mouse=v		" Middle-click paste with mouse
set hlsearch		" Highlight search results
set tabstop=4		" Nr or columns occupied by a tab
set softtabstop=4	" see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting


"-------KEY-BINDINGS-------
let mapleader=" "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>lua require "telescope".extensions.file_browser.file_browser({ path = vim.fn.expand("%:p:h") })<cr>
nnoremap <leader>br <cmd>lua require "telescope".extensions.file_browser.file_browser()<cr>




"-------PLUGINS-------
call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'christoomey/vim-tmux-navigator'

Plug 'rebelot/kanagawa.nvim'

call plug#end()


"-------TELESCOPE-------
lua << EOF
require("telescope").load_extension "file_browser"
require("kanagawa").load("wave")
EOF


"-------LSP-------
lua << EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

EOF
