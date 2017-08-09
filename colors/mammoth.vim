" Copyright © 2017 Zandr Martin
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
  echoerr 'The mammoth colorscheme requires a true-color Vim (Neovim or Gvim).'
  finish
endif

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'mammoth'

highlight Normal                guifg=#d2c8c4 guibg=#372c28 gui=NONE           cterm=NONE           term=NONE
highlight Visual                guifg=NONE    guibg=#221b19 gui=NONE           cterm=NONE           term=NONE
highlight CursorLine            guifg=NONE    guibg=#3f3430 gui=NONE           cterm=NONE           term=NONE
highlight CursorLineNr          guifg=#c8ae9b guibg=#3f3430 gui=NONE           cterm=NONE           term=NONE
highlight LineNr                guifg=#69524c guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight StatusLine            guifg=#d2c8c4 guibg=#5d4b44 gui=NONE           cterm=NONE           term=NONE
highlight StatusLineNC          guifg=#5d4b44 guibg=#221b19 gui=NONE           cterm=NONE           term=NONE
highlight VertSplit             guifg=#221b19 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Comment               guifg=#846960 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight String                guifg=#c9a79c guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight MatchParen            guifg=#ff7700 guibg=NONE    gui=bold           cterm=NONE           term=NONE
highlight Pmenu                 guifg=#d2c8c4 guibg=#5d4b44 gui=NONE           cterm=NONE           term=NONE
highlight PmenuSbar             guifg=#977b70 guibg=#977b70 gui=NONE           cterm=NONE           term=NONE
highlight PmenuThumb            guifg=NONE    guibg=#4e433b gui=NONE           cterm=NONE           term=NONE
highlight Error                 guifg=#f53900 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight SpellBad              guifg=#f53900 guibg=NONE    gui=underline      cterm=underline      term=underline
highlight SpellCap              guifg=#ff7700 guibg=NONE    gui=underline      cterm=underline      term=underline
highlight Search                guifg=#ffffff guibg=#ad721f gui=NONE           cterm=NONE           term=NONE
highlight TODO                  guifg=#ff7700 guibg=NONE    gui=bold,underline cterm=bold,underline term=bold,underline
highlight DiffAdd               guifg=#7af500 guibg=#336600 gui=NONE           cterm=NONE           term=NONE
highlight DiffChange            guifg=#e2e212 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight DiffText              guifg=#e2e212 guibg=#636303 gui=NONE           cterm=NONE           term=NONE
highlight DiffDelete            guifg=#f53900 guibg=#80001e gui=NONE           cterm=NONE           term=NONE
highlight GitGutterChange       guifg=#ff7700 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight GitGutterAdd          guifg=#7af500 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight GitGutterChangeDelete guifg=#ff7700 guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight ErrorMsg              guifg=#ffffff guibg=#f53900 gui=bold           cterm=bold           term=bold
highlight WarningMsg            guifg=#ffffff guibg=#ff7700 gui=bold           cterm=bold           term=bold
highlight Whitespace            guifg=#3f3430 guibg=NONE    gui=NONE           cterm=NONE           term=NONE

highlight TabLineSel            guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight TabLineClose          guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Directory             guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Underlined            guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Question              guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight MoreMsg               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight ModeMsg               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight SpellRare             guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight SpellLocal            guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Boolean               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Constant              guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Special               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Identifier            guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Statement             guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight PreProc               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Type                  guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Define                guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Number                guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Function              guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Include               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight PreCondit             guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Keyword               guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Title                 guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Delimiter             guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight StorageClass          guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE
highlight Operator              guifg=NONE    guibg=NONE    gui=NONE           cterm=NONE           term=NONE

highlight! link TabLine                   StatusLine
highlight! link WildMenu                  Search
highlight! link NeomakeWarningSign        GitGutterChange
highlight! link NeomakeErrorSign          Error
highlight! link GitGutterDelete           Error
highlight! link CursorColumn              CursorLine
highlight! link ColorColumn               CursorLine
highlight! link PmenuSel                  WildMenu
highlight! link SignColumn                LineNr
highlight! link FoldColumn                LineNr
highlight! link Folded                    LineNr
highlight! link TabLineFill               StatusLine
highlight! link BufTabLineActive          TabLine
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
