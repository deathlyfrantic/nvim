" Copyright © 2018 Zandr Martin
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
" OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
" OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
if !has('gui_running') && !((&termguicolors) || (has('nvim') && $NVIM_TUI_ENABLE_TRUE_COLOR))
  echoerr 'The snowblind colorscheme requires a true-color Vim (Neovim or Gvim).'
  finish
endif

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'snowblind'

highlight Normal                guifg=#000000 guibg=#ffffff gui=NONE           cterm=NONE           term=NONE
highlight Visual                guifg=NONE    guibg=#dddddd gui=NONE           cterm=NONE           term=NONE
highlight CursorLine            guifg=NONE    guibg=#eeeeee gui=NONE           cterm=NONE           term=NONE
highlight CursorLineNr          guifg=#666666 guibg=#eeeeee gui=NONE           cterm=NONE           term=NONE
highlight LineNr                guifg=#888888 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight StatusLine            guifg=#ffffff guibg=#000000 gui=NONE           cterm=NONE           term=NONE
highlight StatusLineNC          guifg=#444b5d guibg=#eeeeee gui=NONE           cterm=NONE           term=NONE
highlight VertSplit             guifg=#eeeeee guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Comment               guifg=#888888 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight String                guifg=#555555 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight MatchParen            guifg=#ff8800 guibg=NONE    gui=bold           cterm=NONE           term=NONE
highlight Pmenu                 guifg=#ffffff guibg=#000000 gui=NONE           cterm=NONE           term=NONE
highlight PmenuSbar             guifg=#777777 guibg=#777777 gui=NONE           cterm=NONE           term=NONE
highlight PmenuThumb            guifg=NONE    guibg=#333333 gui=NONE           cterm=NONE           term=NONE
highlight Error                 guifg=#ff0000 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight SpellBad              guifg=#f50039 guibg=NONE    gui=underline      cterm=underline      term=underline
highlight SpellCap              guifg=#ff8800 guibg=NONE    gui=underline      cterm=underline      term=underline
highlight Search                guifg=#ffffff guibg=#3399ff gui=NONE           cterm=NONE           term=NONE
highlight TODO                  guifg=#ff8820 guibg=NONE    gui=bold,underline cterm=bold,underline term=bold,underline
highlight DiffAdd               guifg=#00ff00 guibg=#008800 gui=NONE           cterm=NONE           term=NONE
highlight DiffChange            guifg=#ffff00 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight DiffText              guifg=#ffff00 guibg=#888800 gui=NONE           cterm=NONE           term=NONE
highlight DiffDelete            guifg=#ff0000 guibg=#880000 gui=NONE           cterm=NONE           term=NONE
highlight GitGutterChange       guifg=#ff8800 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight GitGutterAdd          guifg=#00ff00 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight GitGutterChangeDelete guifg=#ff8800 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight ErrorMsg              guifg=#ffffff guibg=#ff0000 gui=bold           cterm=bold           term=bold
highlight WarningMsg            guifg=#ffffff guibg=#ff8800 gui=bold           cterm=bold           term=bold
highlight BufTabLineActive      guifg=#aaaaaa guibg=#000000 gui=NONE           cterm=NONE           term=NONE

highlight TabLineSel   NONE
highlight TabLineClose NONE
highlight Directory    NONE
highlight Underlined   NONE
highlight Question     NONE
highlight MoreMsg      NONE
highlight ModeMsg      NONE
highlight SpellRare    NONE
highlight SpellLocal   NONE
highlight Boolean      NONE
highlight Constant     NONE
highlight Special      NONE
highlight Identifier   NONE
highlight Statement    NONE
highlight PreProc      NONE
highlight Type         NONE
highlight Define       NONE
highlight Number       NONE
highlight Function     NONE
highlight Include      NONE
highlight PreCondit    NONE
highlight Keyword      NONE
highlight Title        NONE
highlight Delimiter    NONE
highlight StorageClass NONE
highlight Operator     NONE

highlight! link TabLine                   StatusLine
highlight! link WildMenu                  Search
highlight! link GitGutterDelete           Error
highlight! link NeomakeWarningSign        GitGutterChange
highlight! link NeomakeErrorSign          Error
highlight! link NeomakeInfoSign           GitGutterChangeLine
highlight! link NeomakeMessageSign        GitGutterAdd
highlight! link ALEWarningSign            GitGutterChange
highlight! link ALEErrorSign              GitGutterChange
highlight! link ALEInfoSign               GitGutterChangeLine
highlight! link CursorColumn              CursorLine
highlight! link ColorColumn               CursorLine
highlight! link PmenuSel                  WildMenu
highlight! link SignColumn                LineNr
highlight! link FoldColumn                LineNr
highlight! link Folded                    LineNr
highlight! link TabLineFill               TabLine
highlight! link BufTabLineCurrent         Normal
highlight! link BufTabLineHidden          TabLine
highlight! link BufTabLineFill            TabLine
highlight! link CtrlPMode1                StatusLine
highlight! link CtrlPMode2                StatusLine
highlight! link CtrlPMatch                String
highlight! link SpecialKey                LineNr
highlight! link NonText                   LineNr
highlight! link Conceal                   Comment
highlight! link phpDocTags                Comment
highlight! link IncSearch                 Search
highlight! link gitcommitOverflow         Error
highlight! link Sneak                     Search
highlight! link diffAdded                 DiffAdd
highlight! link diffRemoved               DiffDelete
highlight! link mailQuoted1               String
highlight! link mailQuoted2               Comment
highlight! link pythonDocString           Comment
highlight! link TagbarVisibilityProtected GitGutterChange
highlight! link TagbarVisibilityPublic    GitGutterAdd
highlight! link TagbarVisibilityPrivate   GitGutterDelete
highlight! link Whitespace                Comment
highlight! link SignifySignAdd            GitGutterAdd
highlight! link SignifySignChange         GitGutterChange
highlight! link SignifySignDelete         GitGutterDelete
highlight! link healthSuccess             GitGutterAdd
highlight! link healthWarning             GitGutterChange

highlight BoldyMcBoldFace gui=bold
match BoldyMcBoldFace /./