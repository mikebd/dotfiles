" Vim color file forked from evening.vim

" See current syntax assignments:
"   :so $VIMRUNTIME/syntax/hitest.vim

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "my-evening"

hi Normal ctermbg=Black ctermfg=LightGrey guifg=LightGrey guibg=Black

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White

"hi IncSearch term=reverse cterm=reverse gui=reverse
hi IncSearch term=underline,reverse cterm=bold ctermbg=Magenta ctermfg=Yellow guibg=DarkBlue guifg=LightGreen

hi ModeMsg term=bold cterm=bold gui=bold guibg=DarkBlue guifg=white

" Status line for the current window
hi StatusLine term=underline cterm=none ctermfg=DarkGreen ctermbg=Black gui=none guifg=#ffcc33 guibg=#663333

" Status line for the non-current window
" hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi StatusLineNC term=underline cterm=none ctermfg=DarkBlue ctermbg=Black gui=none,underline guifg=#cc6633 guibg=Black

"hi VertSplit term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=bold ctermbg=Black ctermfg=DarkCyan gui=reverse guibg=cyan guifg=grey10

"hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi Visual term=reverse cterm=none ctermbg=DarkBlue ctermfg=cyan gui=none guibg=DarkGrey guifg=LightCyan

hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=black
hi lCursor guibg=Cyan guifg=black
hi CursorLine term=none cterm=bold gui=none guibg=#300030          " grey30
hi Directory term=bold ctermfg=LightCyan guifg=Cyan

hi LineNr term=underline ctermfg=DarkCyan guifg=DarkCyan
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi NonText term=none ctermfg=DarkGrey guifg=DarkCyan
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green

hi Search term=reverse cterm=bold ctermbg=Grey ctermfg=DarkBlue gui=none guibg=DarkGrey guifg=LightGreen

hi SpecialKey term=bold ctermfg=DarkGrey guifg=DarkCyan
hi Title term=bold ctermfg=LightMagenta gui=none guifg=Magenta
hi WarningMsg term=standout ctermfg=LightRed guifg=LightRed
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=Black ctermfg=Green guibg=Black guifg=LightGreen
hi FoldColumn term=standout ctermbg=Black ctermfg=Green guibg=Black guifg=LightGreen
hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan

" Groups for syntax highlighting
"hi Constant term=underline ctermfg=Magenta guifg=#ffa0a0 guibg=grey5
hi Constant term=underline ctermfg=Grey guifg=Grey70
hi Special term=bold ctermfg=LightGrey guifg=Orange guibg=grey5

hi PreProc ctermfg=DarkGreen
hi Bug term=bold cterm=bold ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Fixme term=bold cterm=bold ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Note term=bold cterm=bold ctermbg=Blue ctermfg=White guibg=Blue guifg=White
hi Todo term=bold cterm=bold ctermbg=Blue ctermfg=White guibg=Blue guifg=White
hi Type gui=none
hi Function guifg=Green
hi Boolean guifg=#1F85FF
hi Number guifg=#FFD71F
hi String guifg=#2FA2DB
"hi Comment guibg=#331167 guifg=LightGrey
hi Comment ctermfg=DarkCyan guibg=#003333 guifg=#66cc99

" statusline color for file format != dos
hi User1 term=bold cterm=bold ctermbg=Red ctermfg=White guibg=DarkRed guifg=White

if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Yellow guifg=#ffff60 gui=bold
endif
hi Statement ctermfg=DarkYellow guifg=DarkYellow
hi Ignore ctermfg=DarkGrey guifg=grey20

" vim: sw=2

