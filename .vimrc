set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kana/vim-fakeclip'

" File Plugins
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'tpope/vim-rails'
Plugin 'ehamberg/vim-cute-python'
Plugin 'kchmck/vim-coffee-script' " cofee-script file support
Plugin 'jnwhiteh/vim-golang'
Plugin 'elixir-lang/vim-elixir'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'leshill/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'

" Interface
Plugin 'altercation/vim-colors-solarized'
Plugin 'myusuf3/numbers.vim' " relative numbers
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'shougo/neocomplcache' " auto-complete plugin
Plugin 'majutsushi/tagbar' " exuberant tags, etc
Plugin 'scrooloose/syntastic' " syntax checker
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on           " enable syntax highlighting
set number ruler    " show line numbers
set backspace=indent,eol,start
set incsearch           " incremental searching (auto shifting when looking in file)

" Indent Settings
set autoindent      " auto indentation rules
set smartindent     " smart indentation rules
set tabstop=4       " tab size = X
set shiftwidth=4    " soft space = X
set expandtab       " expand tab to spaces
set showmatch       " highlight matching braces

" Enable Folding
"set foldenable
"set fdm=indent

" Formatting
set formatoptions=tcqr  " Describe automatic formatting ordering
set cindent             " C code indentation
set cinoptions=:0,p0,t0 " Amount for indent; parameter declaraction style (a, b); don't indent type declarations
set cinwords=if,else,while,do,for,switch,case   " Things that begin an indentation level in C

" Misc.
set ls=2            " Always show status line
set ttyfast         " Enable Fast Terminal
set noerrorbells    " no error bells (beeps)
set undolevels=1000 " X undo's saved
set lazyredraw      " don't redraw when don't have to
set autoread        " watch for file changes
set scrolloff=10    " keep X lines above/below when scrolling
set number          " show line numbers
set nocp            " Enable no-compatible (for fancy vim features)
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)] " Informative status line

" Filetype related automatics
filetype on         " Enable file-type detection
filetype indent on  " Enable file-type specific indenting
filetype plugin on  " Enable file-type specific plugins


" use .astylerc for indentation rules
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle
autocmd BufNewFile,BufRead *.hpp set formatprg=astyle

" Color and Theme
set t_Co=256    " force 256 term colors
syntax on       " syntax hilight on
colorscheme molokai
let g:rehash256 = 1

"
" Keyboard navigation settings
"

" tab navigation like firefox
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" Space will toggle folds!
nnoremap <space> za

"
" Auto scripts
"

" Remove any trailing whitespace that is in the file (on read/write)
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Numbers.
nnoremap <F3> :NumbersToggle<CR>

" tab is actually a tab in Makefiles
autocmd FileType make setlocal noexpandtab

" setup indent guides plugin
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1

" setup tabstops for a variety of languages
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

" handle files with multiple extensions to set all filestypes
function MultiExtensionFiletype()
  let ft_default=&filetype
  let ft_prefix=substitute(matchstr(expand('%'),'\..\+\.'),'\.','','g')
  sil exe "set filetype=" . ft_prefix  . "." . ft_default
endfunction
