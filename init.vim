
let g:ale_completion_enabled = 1

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'srcery-colors/srcery-vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}

" Airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Django plugins
Plug 'tweekmonster/django-plus.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}

"Nginx plugin
Plug 'chr4/nginx.vim'

" Javascript Plugins

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'

call plug#end()


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

" Settings for Ale

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['prospector', 'isort'],
\	'javascript':['prettier', 'eslint'],
\	'css':['prettier'],
\	'jsx':['prettier'],
\   'scss':['prettier']
\}

let g:ale_fix_on_save = 1

" Settings for javascript Linter
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_mudles/.bin/eslint -fix %

" Maintain undo history between sessions
set undofile

" Airline Settings
let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
