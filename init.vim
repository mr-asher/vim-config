call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'Shougo/unite.vim'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}
Plug 'Galooshi/vim-import-js'

" Django plugins
Plug 'tweekmonster/django-plus.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}

"Nginx plugin
Plug 'chr4/nginx.vim'

" Zen Coding
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'

" Coding Snippets
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end() 

" Run prettier on save
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat

" Colour settings
set t_Co=256
set background = "dark"
colorscheme srcery

" Auto complete for js settings
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_enable_diagnostic_highlighting = 0

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Python mode settings
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120

" Map ; to : because ; is useless
nnoremap ; :

" No tabs thanks. They're gross
set tabstop=4 shiftwidth=4 expandtab

" Settings for UltiSnips
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardsTrigger = "<c-z>"
