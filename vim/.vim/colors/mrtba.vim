" Vim dark color theme for gui
" Color names from: http://choorucode.com/2011/07/29/vim-chart-of-color-names/
" Tobias Anderberg, 2012.

if has("gui_running")
    set background=dark
else
	set background=light
endif

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "mrtba"

" --------------------------------------------------------------------------------
" General
" --------------------------------------------------------------------------------
hi Normal		guifg=gray84	  guibg=black
hi Cursor		guifg=black	      guibg=LightGoldenrod1
hi Visual		guifg=ivory1	  guibg=gray25
hi Search		guifg=black	      guibg=NavajoWhite4
hi StatusLine	guifg=gray79	  guibg=gray35           gui=italic
hi StatusLineNC	guifg=gray30	  guibg=gray20
hi VertSplit	guifg=gray29	  guibg=gray29

hi MatchParen   guifg=black       guibg=yellow1

hi ErrorMsg     guifg=red1        guibg=black            gui=italic
hi WarningMsg   guifg=LightPink1  guibg=black            gui=italic
hi ModeMsg      guifg=LightPink1  guibg=black            gui=italic
hi NonText      guifg=gray20      guibg=black

" --------------------------------------------------------------------------------
" Syntax highlighting
" --------------------------------------------------------------------------------
hi Include      guifg=PaleVioletRed1 gui=italic
hi Define       guifg=DarkOrchid2    gui=italic
hi Macro        guifg=DarkOrchid2    gui=italic
hi PreCondit    guifg=DarkOrchid2    gui=italic

hi Identifier	guifg=DarkGoldenrod3    gui=none
hi Function		guifg=DarkOrange3       gui=none

" These are custom defined in .vim/after/syntax/cpp/custom.vim
hi ClassNamespace guifg=goldenrod3
hi StlNamespace   guifg=SteelBlue1
hi StlContainer   guifg=SteelBlue1

hi Constant		guifg=HotPink1	     gui=none
hi String		guifg=salmon1        gui=italic
hi Statement	guifg=SteelBlue1     gui=none
hi Type			guifg=gold1          gui=none
hi Comment		guifg=SpringGreen4   gui=italic
hi Todo			guifg=firebrick1     guibg=black    gui=italic

hi Special		guifg=SlateGray2        gui=none
