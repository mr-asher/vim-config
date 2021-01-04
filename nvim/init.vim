call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                                          " make statusline awesome
Plug 'vim-airline/vim-airline-themes'                                   " themes for statusline 
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() }} " markdown preview
Plug 'neoclide/coc.nvim', {'branch': 'release'}                          " Welcome to 2013
Plug 'rafi/awesome-vim-colorschemes'                                    " More colorschemes
Plug 'sheerun/vim-polyglot'                                             " A collection of language packs for Vim
Plug 'brooth/far.vim'                                                   " Find and replace 
" Plug 'numirias/semshi'                                                " Better syntax highlighting
" Plug 'janko/vim-test'
Plug 'kien/ctrlp.vim'
Plug 'jparise/vim-phabricator'
Plug 'tpope/vim-fugitive'
Plug 'ruanyl/vim-sort-imports'

call plug#end()

" Better leader key
let mapleader = " "

" Spelling (which I suck at big time)

" Fix word
nnoremap <leader>f 1z=

" Turn spelling on/ off
nnoremap <leader>s :set spell!<CR>

" Allow mouse scrolling in windows terminal
set mouse=a

" Set ctrlp to ignore files/ folders in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Better Terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-a> <Esc>
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" Quck exit insert mode
inoremap jk <ESC>

filetype indent on

" use the terminal colors
set termguicolors
"
" colorscheme options
colorscheme onedark 

set number  " always show current line number
set wrapscan  " begin search from top of file when nothing is found anymore

set history=1000  " remember more commands and search history

set scrolloff=3 " keep three lines between the cursor and the edge of the screen

set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
set undofile " Maintain undo history between sessions

set splitright  " i prefer splitting right and below
set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>

set visualbell
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
 
" Airline settings
" do not show error/warning section
let g:airline_section_error = ""
let g:airline_section_warning = ""

if !exists('g:airline_symbols')
    let g:airline_symbols = {}

" Coc example settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif

" Line length indicators
autocmd FileType javascript setlocal colorcolumn=120
autocmd FileType python setlocal colorcolumn=120

" Easy open terminal
nnoremap <C-t> :sp term://zsh<CR> :resize 10 <CR> A

" Sort js imports on write
let g:import_sort_auto = 1

" Phabricator adacs support
let g:phabricator_hosts = 'phab.adacs.org.au'

" For use with Far 
let g:far#enable_undo=1

set expandtab
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 fillchars+=vert:\
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Set test runner for python
let test#python#runner = 'pytest'
let test#python#pytest#file_pattern = '\v(test[^/]+|[^/]+_test)\.py$'
