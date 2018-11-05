" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
Plug 'majutsushi/tagbar'
Plug 'tomfleming/yalp-nvim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'rust-lang/rust.vim'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'

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

" SHORTCUT FOR FZF
map <C-f> :FZF<CR>

" TURN ON SEARCH HIGHLIGHTING
set hlsearch

" FIX INDENTS TO 4 SPACES
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" SET A VERTICAL LINE AT 73 and 80 CHARACTERS
let &colorcolumn="73,80"

" SET COLORSCHEME
colorscheme solarized
if strftime("%H")>=20 || strftime("%H")<=8
    set background=light
else
	set background=dark
endif

" SIMPLIFY SPLIT NAVIGATION
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" ENABLE CONTROL-P PLUGIN
set runtimepath^=~/.vim/bundle/ctrlp.vim

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
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 spell
autocmd Filetype rst setlocal spell
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead Jenkinsfile* set filetype=groovy


" FIXES FOR YCM
let g:ycm_python_binary_path = 'python'


" GOTO SHORTCUT FOR YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

" make Prettier run async
let g:prettier#exec_cmd_async = 1


" Show python docstring previews
let g:SimpylFold_docstring_preview = 1

" Turn off indentline for JSON
autocmd Filetype json let g:indentLine_conceallevel=0

" Tagbar settings
let g:tagbar_autofocus = 1
nmap <C-T> :TagbarToggle<CR>
autocmd BufWritePre,FileWritePre * TagbarClose

" use pycodestyle for linting python files
let g:ale_linters = { 'python': ['pycodestyle'], 'javascript': ['prettier-eslint']}
let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
