call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'                                              " file list
Plug 'majutsushi/tagbar'                                                " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'                                          " make statusline awesome
Plug 'vim-airline/vim-airline-themes'                                   " themes for statusline 
Plug 'jonathanfilip/vim-lucius'                                         " nice white colortheme
Plug 'ycm-core/YouCompleteMe'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                          " to highlight files in nerdtree
Plug 'Vimjas/vim-python-pep8-indent'                                    " better indenting for python
Plug 'kien/ctrlp.vim'                                                   " fuzzy search files
Plug 'tweekmonster/impsort.vim'                                         " color and sort imports
Plug 'mxw/vim-jsx'                                                      " jsx highlight
Plug 'w0rp/ale'                                                         " python linters
Plug 'airblade/vim-gitgutter'                                           " show git changes to files in gutter
Plug 'tpope/vim-commentary'                                             " comment-out by gc
Plug 'jparise/vim-graphql'                                              " graphql syntax highlighting
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() }} " markdown preview
Plug 'tweekmonster/django-plus.vim'                                     " Make django great again
Plug 'SirVer/ultisnips'                                                 " Snippet engine
Plug 'honza/vim-snippets'                                               " Actual snippets to use
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }                  " Prettier for javascript projects
Plug 'psf/black'                                                        " Black integration
Plug 'fisadev/vim-isort'                                                " isort integration
Plug 'gcmt/taboo.vim'                                                   " Easy tab rename
Plug 'Yggdroot/indentLine'                                              " Show code indent lines

call plug#end()

" path to your python 
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

filetype indent on

set fileformat=unix
set shortmess+=c

set number  " always show current line number
set wrapscan  " begin search from top of file when nothing is found anymore

set expandtab
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 fillchars+=vert:\
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

set history=1000  " remember more commands and search history

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
set undofile " Maintain undo history between sessions

set noshowmode  " keep command line clean
set noshowcmd

set laststatus=2  " always show statusline

set splitright  " i prefer splitting right and below
set splitbelow

set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>

set visualbell
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

" colorscheme options
let g:lucius_contrast="low"
colo lucius

set pumheight=5

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
 
" Airline settings
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" theicfire .vimrc tips
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " " " Leader is the space key
let g:mapleader = " "
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>

" ale options
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_linters = {
\ 'javascript': ['eslint', 'flow'],
\ 'python': ['flake8', 'pylint', 'black']
\}
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = '0'

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'

" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127

" Remove all trailing whitespace by pressing C-S
nnoremap <C-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

nnoremap <silent><nowait> [ [[
nnoremap <silent><nowait> ] ]]

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'[m'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.']m'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType python call MakeBracketMaps()
augroup END

" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
 
" ctrl p options
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|pyc|so|dll)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Better Terminal mode
tnoremap <Esc> <C-\><C-n>

" Line length indicators
autocmd FileType javascript setlocal colorcolumn=120
autocmd FileType python setlocal colorcolumn=120

" Trigger configuration for ultisnips.
let g:UltiSnipsExpandTrigger="<c-space>"

" Prettier for files without the @format doc tag
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.json,*.graphql,*.html Prettier

" Run Black on save 
autocmd BufWritePre *.py execute ':Black'

" Run isort on save 
autocmd BufWritePre *.py execute ':Isort'

" Persist taboo names between sessions
set sessionoptions+=tabpages,globals

" IndentLines is useful, but only sometimes. Let's disable it by default
let g:indentLine_enabled = 0

" Code folding!
set foldmethod=indent

" Keep folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
        autocmd!
        autocmd BufRead * normal zR
augroup END
