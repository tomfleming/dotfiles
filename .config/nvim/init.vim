" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'majutsushi/tagbar'
Plug 'tomfleming/yalp-nvim'
Plug 'rust-lang/rust.vim'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Konfekt/FastFold'
Plug 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

" ENABLE SYNTAX HIGHLIGHTING
syntax on
syntax enable

" TURN ON LINE NUMBERS
set number

" SET SHORTCUT FOR NERDTREE
map <C-n> :NERDTreeToggle<CR>
" AUTOMATICALLY CLOSE NERDTree AFTER OPENING A FILE
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

" SHORTCUTS FOR FZF
map <C-f> :FZF<CR>
map <C-f><C-p> :Rg<CR>

" TURN ON SEARCH HIGHLIGHTING
set hlsearch
set ignorecase
set smartcase

" FIX INDENTS TO 4 SPACES
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" SET A VERTICAL LINE AT 80 and 88 CHARACTERS, WRAP AT 88
let &colorcolumn="80,119"
set textwidth=120

" SET COLORSCHEME
colorscheme solarized
set background=light

" SIMPLIFY SPLIT NAVIGATION
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" ENABLE INVERSE TABBING
" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i

" DISABLE MOUSE CLICKING
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
vmap <LeftMouse> <nop>
nmap <RightMouse> <nop>
imap <RightMouse> <nop>
vmap <RightMouse> <nop>

" AUTOMATICALLY REMOVE TRAILING WHITESPACE WHEN WRITING A BUFFER
autocmd BufWritePre * :%s/\s\+$//e

" SIMPLIFY CODE FOLDING
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zO
set foldmethod=indent

let g:rust_fold = 2

" MAKE AIRLINE SHOW UP BY DEFAULT
" Follow these instructions to get the symbols working:
" https://powerline.readthedocs.org/en/latest/installation.html#fonts-installation
let g:airline_powerline_fonts=1

set laststatus=2
set encoding=utf-8

" MAKE BACKSPACE WORK CONSISTENTLY WITH OTHER APPS
set backspace=2

" SET BETTER TABBING STYLES FOR HTML AND JAVASCRIPT
filetype plugin on
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype pug setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 spell
autocmd Filetype rst setlocal spell
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead Jenkinsfile* set filetype=groovy
autocmd BufNewFile,BufRead *.pug set filetype=pug
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx


" ENABLE BASIC JAVA FUNCTIONALITY
let g:EclimCompletionMethod = 'omnifunc'


" GOTO SHORTCUT FOR ALE
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jv :vsplit<CR><Plug>(coc-definition)
nmap <leader>jr <Plug>(coc-references)


" Turn off indentline for JSON and Markdown
autocmd Filetype json,markdown let g:indentLine_conceallevel=0
let g:indentLine_fileTypeExclude = ['json', 'markdown']

" Tagbar settings
let g:tagbar_autofocus = 1
nmap <C-T> :TagbarToggle<CR>
autocmd BufWritePre,FileWritePre * TagbarClose

" use flake8 for linting python files
" pretty good setup for TS linting:
" https://www.robertcooper.me/using-eslint-and-prettier-in-a-typescript-project
let g:ale_python_auto_pipenv = 1
let g:ale_linters = {
            \ 'css': ['stylelint'],
            \ 'html': ['htmlhint'],
            \ 'javascript': ['prettier'],
            \ 'json': ['jsonlint'],
            \ 'python': ['flake8', 'pyls', 'mypy'],
            \ 'php': ['phpcs'],
            \ 'sh': ['shellcheck'],
            \ 'typescript': ['eslint', 'tslint', 'prettier'],
            \ 'vue': ['prettier'],
            \ 'yaml': ['yamllint'],
            \ }

let g:ale_python_mypy_options = '--check-untyped-defs'
let g:ale_python_pyls_config = {
  \   'pyls': {
  \     'configurationSources': ['flake8'],
  \     'plugins': {
  \       'pyflakes': {
  \         'enabled': v:false
  \       },
  \       'pycodestyle': {
  \         'enabled': v:false
  \       },
  \       'pylint': {
  \         'enabled': v:false
  \       }
  \     }
  \   },
  \ }
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_fixers = {
            \ 'css': ['prettier'],
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'json': ['prettier'],
            \ 'php': ['phpcbf', 'php_cs_fixer'],
            \ 'python': ['black'],
            \ 'typescript': ['prettier', 'tslint', 'eslint'],
            \ 'vue': ['prettier'],
            \ 'yaml': ['prettier'],
            \ }
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'

"make ale play nice with coc
let g:ale_disable_lsp = 1

" let ale do the syntax checking, disable it in nvim_typescript
let g:nvim_typescript#diagnostics_enable = 0


" allow coc to complete with <TAB>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" yank directly to clipboard
set cb=unnamed

" Set bash as the shell for instant-markdown to work
" https://github.com/instant-markdown/vim-instant-markdown#faq
set shell=bash\ -i
