setlocal omnifunc=python3complete#Complete

function! s:pydoc_man(...) abort
  call utils#preview(systemlist(printf('pydoc3 %s', a:1)))
endfunction

command! -nargs=1 PydocPreview call <SID>pydoc_man(<f-args>)
setlocal keywordprg=:PydocPreview

" highlight docstrings as comments
function! s:docstring_highlight() abort
  syntax region pythonDocstring start=+^\s*[uU]\?[rR]\?\%("""\|'''\)+
    \ end=+\%("""\|'''\)+ keepend excludenl
    \ contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
  highlight default link pythonDocstring pythonComment
endfunction

autocmd Syntax <buffer> call <SID>docstring_highlight()
