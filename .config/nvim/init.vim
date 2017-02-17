" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'leafgarland/typescript-vim'
Plug 'suan/vim-instant-markdown'
Plug 'majutsushi/tagbar'
Plug 'tomfleming/yalp-nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

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

" MAKE AIRLINE SHOW UP BY DEFAULT
" Follow these instructions to get the symbols working:
" https://powerline.readthedocs.org/en/latest/installation.html#fonts-installation
let g:airline_powerline_fonts=1

set laststatus=2
set encoding=utf-8

" RECOMMENDED SYNTASTIC DEFAULTS
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["javascript"]}
let g:syntastic_python_checkers = ['pycodestyle']


" EASYMOTION
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)

" MAKE BACKSPACE WORK CONSISTENTLY WITH OTHER APPS
set backspace=2

" SET BETTER TABBING STYLES FOR HTML AND JAVASCRIPT
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 spell
autocmd BufNewFile,BufRead *.md set filetype=markdown

" FIXES FOR YCM
if has('mac')
    let g:ycm_path_to_python_interpreter = 'python'
elseif has('unix')
    let g:ycm_python_binary_path = 'python'
endif

" GOTO SHORTCUT FOR YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

" SET SHROTCUT FOR PRETTY HTML/CSS/JS
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType javascript.jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Show python docstring previews
let g:SimpylFold_docstring_preview = 1

" Turn off indentline for JSON
autocmd Filetype json let g:indentLine_conceallevel=0

" Tagbar settings
let g:tagbar_autofocus = 1
nmap <C-T> :TagbarToggle<CR>
autocmd BufWritePre,FileWritePre * TagbarClose

" MAP FUZZY FINDER
nmap <C-F> :FZF<CR>
