" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:       greg@kroah.com
" Last Change:      2001 Sep 17

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "greg"

"hi Normal                                                                  guifg=cyan     guibg=black
"hi Comment     term=bold                   ctermfg=DarkCyan                guifg=#80a0ff
"hi Identifier  term=underline  cterm=bold  ctermfg=Cyan                    guifg=#40ffff
"hi Statement   term=bold                   ctermfg=Brown        gui=bold   guifg=#aa4444
"hi Type        term=underline              ctermfg=Blue         gui=bold   guifg=#60ff60

hi Include      term=underline              ctermfg=Blue         guifg=#ff80ff
hi Define       term=underline              ctermfg=Blue
hi Function     term=bold                   ctermfg=Cyan         guifg=DarkBlue
hi Comment      term=bold                   ctermfg=DarkCyan     guifg=DarkCyan
hi Identifier   term=underline  cterm=bold  ctermfg=Cyan         guifg=DarkBlue
hi Operator                                 ctermfg=Red          guifg=Red
hi PreProc      term=underline              ctermfg=Blue         guifg=#ff80ff
hi String       term=underline              ctermfg=DarkRed      guifg=#ff80ff

hi Constant     term=underline              ctermfg=DarkCyan     guifg=Magenta
hi Repeat       term=underline              ctermfg=Brown        guifg=Brown
hi Statement    term=bold                   ctermfg=Brown        guifg=Brown     gui=NONE
hi Type         term=underline              ctermfg=Blue         guifg=Blue      gui=NONE
hi Special      term=bold                   ctermfg=DarkMagenta  guifg=Red
hi Todo         term=standout               ctermbg=Yellow       ctermfg=Black   guifg=Blue      guibg=Yellow
hi Error        term=reverse                ctermbg=Red          ctermfg=White   guibg=Red       guifg=White
hi Ignore                                   ctermfg=Black        guifg=bg

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
"hi link Define          PreProc
"hi link Include         PreProc
"hi link String          Constant
hi link Conditional     Repeat
hi link Keyword         Statement
hi link Label           Statement
hi link Exception       Statement

hi link Number          Operator
hi link Float           Number

hi link Boolean         Constant
hi link Character       Constant

hi link Macro           PreProc
hi link PreCondit       PreProc

hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type

hi link Debug           Special
hi link Delimiter       Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Tag             Special
