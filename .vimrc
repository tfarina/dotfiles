" Enable syntax highlighting.
if has("syntax")
    syntax on
endif

filetype plugin indent on
map <C-K> :pyf ~/llvm-clang/llvm/tools/clang/tools/clang-format/clang-format.py<CR>

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix = 1

if filereadable("~/chromium/src/tools/vim/filetypes.vim")
  source ~/chromium/src/tools/vim/filetypes.vim
endif

if filereadable("~/src/ninja/misc/ninja.vim")
  source ~/src/ninja/misc/ninja.vim
endif

colorscheme greg
set background=dark               " Use dark background.
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

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs.
autocmd FileType make set noexpandtab

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

iab #i <C-R>=SmartInclude()<CR>

" Insert chromium source code copyright policy at the top of the file on ,lb.
nmap ,lb :call IncludeChromiumCopyrightLicense()<CR>

" Insert an include guard based on the file name on ,i.
nmap ,i :call IncludeGuard()<CR>

" Comment selected lines on ,c in visual mode.
vmap ,c :s,^,// ,<CR>:noh<CR>
" Uncomment selected lines on ,u in visual mode.
vmap ,u :s,^// ,,<CR>

" Map a fold to F6.
nmap <F6> /}<CR>zf%<ESC>:nohlsearch<CR>

autocmd BufNewFile,BufRead * call SetCodingStyle()

augroup NewFiles
  au!
  au BufNewFile *.h call IncludeGuard()
augroup END
