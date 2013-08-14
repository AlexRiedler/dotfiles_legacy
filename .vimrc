" Handle Pathogen Module Tracking
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

syntax on           " enable syntax highlighting
set number ruler    " show line numbers
set backspace=indent,eol,start
set incsearch           " incremental searching (auto shifting when looking in file)

" Indent Settings
set autoindent      " auto indentation rules
set smartindent     " smart indentation rules
set tabstop=2       " tab size = X
set shiftwidth=2    " soft space = X
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
set nocompatible

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
let g:molokai_original = 1
colorscheme molokai

" Syntax Settings
let python_highlight_all = 1

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
"nnoremap <F3> :NumbersToggle<CR>
"This is for setting Makefiles with tabs not spaces
autocmd FileType make setlocal noexpandtab


let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

let g:flake8_max_line_length=120
autocmd BufWritePost *.py call Flake8()


autocmd BufRead,BufNewFile *.html, *.html.erb set noexpandtab


function MultiExtensionFiletype()
  let ft_default=&filetype
  let ft_prefix=substitute(matchstr(expand('%'),'\..\+\.'),'\.','','g')
  sil exe "set filetype=" . ft_prefix  . "." . ft_default
endfunction
"autocmd BufReadPost *.*.* call MultiExtensionFiletype()
autocmd BufRead,BufNewFile *.hamlc.erb setlocal filetype=haml
autocmd BufRead,BufNewFile *.hamstache setlocal filetype=haml

set clipboard=unnamed

autocmd BufEnter * silent! lcd %:p:h

