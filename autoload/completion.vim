function! completion#findstart() abort
  let [curpos, pos] = [getcurpos(), searchpos('\s', 'bn')]
  return pos[0] == curpos[1] ? pos[1] : 0
endfunction

function! completion#tab(fwd) abort
  if pumvisible()
    return a:fwd ? "\<C-N>" : "\<C-P>"
  elseif z#char_before_cursor() =~ '\k'
    return "\<C-P>"
  endif
  return "\<Tab>"
endfunction

function! completion#undouble()
  " stolen from Damian Conway
  " (https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc#L1285-L1298)
  let [col, line] = [col('.'), getline('.')]
  let new_line = substitute(line, '\(\.\?\k\+\)\%' .. col .. 'c\zs\1', '', '')
  call setline('.', new_line)
endfunction

function! completion#wrap(f) abort
  let F = type(a:f) == v:t_string ? function(a:f) : a:f
  let [col, start] = [col('.'), F(1, 0)]
  let base = getline('.')[start:col]
  call complete(start + 1, F(0, base))
endfunction
