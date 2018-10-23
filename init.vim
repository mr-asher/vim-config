call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/unite.vim'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}

" Django plugins
Plug 'tweekmonster/django-plus.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}

"Nginx plugin
Plug 'chr4/nginx.vim'

call plug#end() 

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Run prettier on save
autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat
autocmd BufWritePre,TextChanged,InsertLeave *.jsx Neoformat

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
