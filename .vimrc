so ~/chromium/src/tools/vim/filetypes.vim

set number                        " Display line numbers.
set numberwidth=1
set background=dark               " Use dark background.
set title                         " Show title in the console title bar.
set history=1000                  " Lots of command line history.
set viminfo='1000,f1,:1000,/1000

set wildmenu
set wildmode=list:longest,full

let &background = "dark"
nmap ,b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Syntax highlight shell scripts as per POSIX, not the original Bourne shell
" which very few use.
let g:is_posix = 1

" Enable syntax highlighting.
if has("syntax")
    syntax on
endif

" Flag problematic whitespace (trailing and spaces before tabs).
" Note you get the same by doing let c_space_errors=1 but this rule really
" applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
" \ze sets end of match so only spaces highlighted.
match RedundantSpaces /\s\+$\| \+\ze\t/

" Visualizing tabs.
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Highlight any leading spaces.
syn match ErrorLeadSpace /^ \+/
" Highlight any trailing spaces.
syn match ErrorTailSpace / \+$/

" Insert space characters whenever the tab key is pressed.
set expandtab

function! SetCodingStyle()
  if (&syntax !~ '^\(c\|cc\|cpp\|h\|java\|python\|objcpp\)$')
    return
  endif
  " The path for the file.
  let pathfn = expand('%:p:h')
  if pathfn =~ 'chromium'
    set tabstop=2 shiftwidth=2
  elseif pathfn =~ 'lithium'
    set tabstop=2 shiftwidth=2
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

function! LicenseHeader(license)
  let filename = $HOME . "/." . a:license . "HEADER"
  execute ":0r " . filename
endfunction

function! IncludeGuard()
  let guard = toupper(substitute(expand('%'), '[\./]', '_', 'g'))
  let guard = substitute(guard, '[\-/]', '_', 'g')
  call append(0, '#ifndef ' . guard . '_')
  call append(1, '#define ' . guard . '_')
  call append(2, '#pragma once')
  call append('$', '#endif  // ' . guard . '_')
endfunction

iab #i <C-R>=SmartInclude()<CR>

" Insert a license header at the top of the file on ,lb.
nmap ,lb :call LicenseHeader("BSD")<CR>

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

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs.
autocmd FileType make set noexpandtab

nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
