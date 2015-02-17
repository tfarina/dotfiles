set nocompatible

filetype off

" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/vim-operator-highlight'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'sgraham/alt'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file.
augroup vimrc
  autocmd!
augroup END

" Enable syntax highlighting.
if has("syntax")
    syntax on
endif

map <C-K> :pyf ~/chromium/src/buildtools/clang_format/script/clang-format.py<CR>

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix = 1

if filereadable("~/chromium/src/tools/vim/filetypes.vim")
  source ~/chromium/src/tools/vim/filetypes.vim
endif

if filereadable("~/src/repos/github.com/martine/ninja/misc/ninja.vim")
  source ~/src/repos/github.com/martine/ninja/misc/ninja.vim
endif

set background=dark
colorscheme valloric

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" Needed after upgrading to version 7.4.
" https://groups.google.com/forum/#!topic/vim_use/nYFinm0hTjY
set backspace=2 " make backspace work like most other apps
"set backspace=indent,eol,start

set number                        " Display line numbers.
set numberwidth=1                 " Use only 1 column while possible.
set colorcolumn=81
set title                         " Show title in the console title bar.
set wildmenu
set wildmode=list:longest,full

set incsearch                     " Do incremental searching - http://www.linuxjournal.com/article/3805
set ignorecase                    " Ignore case when searching.

set foldmethod=indent             " Allow us to fold on indents.
set foldlevel=99                  " Don't fold by default.

set history=1000                  " Lots of command line history.
set viminfo='1000,f1,:1000,/1000

" Insert space characters whenever the tab key is pressed.
set expandtab
set autoindent
set cindent
set smartindent

set laststatus=2

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs.
autocmd FileType make set noexpandtab

" Markdown {{{
au BufRead,BufNewFile *.md set filetype=markdown
" }}}

" Flag problematic whitespace (trailing and spaces before tabs).
" Note you get the same by doing let c_space_errors=1 but this rule really
" applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
" \ze sets end of match so only spaces highlighted.
match RedundantSpaces /\s\+$\| \+\ze\t/

" Highlight any leading spaces.
syn match ErrorLeadSpace /^ \+/
" Highlight any trailing spaces.
syn match ErrorTailSpace / \+$/

" Visualizing tabs.
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

function! SetCodingStyle()
  if (&syntax !~ '^\(c\|cc\|cpp\|h\|java\|python\|objcpp\)$')
    return
  endif
  " The path for the file.
  let pathfn = expand('%:p:h')
  if pathfn =~ 'chromium'
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
  elseif pathfn =~ 'lithium'
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
  endif
endfunction

function! SmartInclude()
  let next = nr2char(getchar(0))
  if next == '"'
    return "#include \".h\"\<Left>\<Left>\<Left>"
  endif
  if next == '>'
    return "#include <>\<Left>"
  endif
  return "#include <.h>\<Left>\<Left>\<Left>"
endfunction

function! IncludeChromiumCopyrightLicense()
  let filename = $HOME . "/chromium/.chromium_bsd_license"
  execute ":0r " . filename
endfunction

function! IncludeGuard()
  let guard = toupper(substitute(expand('%'), '[\./]', '_', 'g'))
  let guard = substitute(guard, '[\-/]', '_', 'g')
  call append(0, '#ifndef ' . guard . '_')
  call append(1, '#define ' . guard . '_')
  call append('$', '#endif  // ' . guard . '_')
endfunction

" Highlight Class and Function names.
function! s:HighlightFunctionsAndClasses()
  syn match cCustomFunc      "\w\+\s*\((\)\@="
  syn match cCustomClass     "\w\+\s*\(::\)\@="

  hi def link cCustomFunc      Function
  hi def link cCustomClass     Function
endfunction

iab #i <C-R>=SmartInclude()<CR>

let mapleader=","

" Insert chromium source code copyright policy at the top of the file on ,lb.
nmap <leader>lb :call IncludeChromiumCopyrightLicense()<CR>

" Insert an include guard based on the file name on ,i.
nmap <leader>i :call IncludeGuard()<CR>

au vimrc Syntax * call s:HighlightFunctionsAndClasses()

" Comment selected lines on ,c in visual mode.
vmap <leader>c :s,^,// ,<CR>:noh<CR>
" Uncomment selected lines on ,u in visual mode.
vmap <leader>u :s,^// ,,<CR>

" Map a fold to F6.
nmap <F6> /}<CR>zf%<ESC>:nohlsearch<CR>

autocmd BufNewFile,BufRead * call SetCodingStyle()

augroup NewFiles
  au!
  au BufNewFile *.h call IncludeGuard()
augroup END
