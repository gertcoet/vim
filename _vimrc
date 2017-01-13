set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=c:/users/gert.coetzee/vimfiles/bundle/Vundle.vim/
call vundle#begin('c:/users/gert.coetzee/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'cream-capitalization'
"Plugin 'SQLComplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"colorscheme badwolf     " awesome color scheme

syntax enable           " enable syntax processing
set background=dark
set clipboard=unnamed
colorscheme solarized

set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4		"Set indent to correspond to tab
set softtabstop=0		" number of spaces in tab when editing

set number              " show line numbers
set showcmd             " show command in bottom bar

set wildmenu            " visual auto complete for command menu
set lazyredraw          " redraw only when we need to.

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set ignorecase			" Ignore case when searching

set smartcase			" When searching try to be smart about cases 

set autochdir			"this is to make the current working directory the one of the file being edited:

nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
set foldenable          " enable folding

set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to the beginning and end of a line 
nmap E $
nmap S ^
 
"Insert a blank line by pressing shift-enter
nmap <Space-Enter> o<Esc>

"jk escape
inoremap jk <esc>
inoremap kj <esc>

"map casing keys
map <Leader>nc <f5>

"highlight last inserted text
nnoremap gV `[v`]

"Remap Shift-Space to enter and leave  normal, insert and visual mode
"imap <S-Space> <Esc>
"vmap <S-Space> <Esc>
"nmap <S-Space> i

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


nmap <C-R> <C-r>

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"set the language for spelling
set spelllang=en_gb

"set swap file creation off
set noswapfile

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"this is to add a macro to put a comma at the end of the line
let @c = '$a,j^'

let @b = 'Si[jkEa],jkjS'

"this a for SQL highlighting:
"let g:sql_type_default = "sqlserver"
"let g:ftplugin_sql_omni_key = '<C-a>'
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
if has("gui_running")
	au GUIEnter * simalt ~x
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

"This is to copy the file path to the clipboard
" Convert slashes to backslashes for Windows.
"cs copies just the filename.
"cl copies the filename including it's full path.
"c8 copies the filename in 8.3 format for DOS and Windows 9x
if has('win32')
  nmap <leader>fn :let @+=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <leader>fp :let @+=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap <leader>f8 :let @+=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif
""" 
"Helper functions
"""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

"call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
"Plug 'dbext.vim'
"Plug 'SQLComplete.vim'
"Plug 'scrooloose/nerdcommenter'
"call plug#end()

