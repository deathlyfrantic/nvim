function! z#preview(text) abort
  if &previewwindow
    return
  endif
  let l:win = win_getid()
  let l:winview = winsaveview()
  pclose!
  execute 'topleft' &previewheight 'new'
  set previewwindow noswapfile nobuflisted buftype=nofile
  nnoremap <silent> <buffer> q :pclose!<CR>
  nnoremap <silent> <buffer> <C-c> :pclose!<CR>
  let l:text = type(a:text) == v:t_list ? a:text : split(a:text, '\n')
  call append(0, l:text)
  call cursor(1, 1)
  call win_gotoid(l:win)
  call winrestview(l:winview)
endfunction

function! z#popup(text) abort
  let buf = nvim_create_buf(v:false, v:true)
  let array_text = type(a:text) == v:t_string ? split(a:text, '\n') : a:text
  let text = [''] + map(copy(array_text), {_, t -> ' ' .. t .. ' '}) + ['']
  call nvim_buf_set_lines(buf, 0, -1, v:true, text)
  let opts = {'relative': 'cursor', 'height': len(text), 'style': 'minimal',
        \ 'focusable': v:false}
  let opts.width = max(map(copy(text), {_, v -> len(v)}))
  let opts.anchor = (screenrow() > (&lines / 2) ? 'S' : 'N')
        \ . (screencol() > (&columns / 2) ? 'E' : 'W')
  let opts.row = opts.anchor[0] == 'N' ? 1 : 0
  let opts.col = opts.anchor[1] == 'E' ? 0 : 1
  let win = nvim_open_win(buf, 0, opts)
  call nvim_win_set_option(win, 'colorcolumn', '0')
  return win
endfunction

function! z#enumerate(l, ...) abort
  let start = a:0 ? a:1 : 0
  let collection = type(a:l) == v:t_string ? split(a:l, '\zs') : a:l
  return map(collection, {i, v -> [(i + start), v]})
endfunction

function! z#zip(a, b) abort
  let collection = len(a:a) > len(a:b) ? a:a[:len(a:b)-1] : a:a
  return map(collection, {i, v -> [v, a:b[i]]})
endfunction

function! z#flatten(list) abort
  let rv = []
  for item in a:list
    let rv += type(item) == v:t_list ? z#flatten(item) : [item]
  endfor
  return rv
endfunction

function! z#echohl(hl, ...) abort
  if !a:0
    throw 'A message is required for this function.'
  endif
  let msg = a:0 > 1 ? call('printf', a:000) : a:1
  let l:echo = 'WarningMsg\|ErrorMsg' =~? a:hl ? 'echomsg' : 'echo'
  execute 'echohl' a:hl
  try
    execute l:echo 'msg'
  finally
    echohl None
  endtry
endfunction

function! z#echowarn(...) abort
  call call('z#echohl', ['WarningMsg'] + a:000)
endfunction

function! z#echoerr(...) abort
  call call('z#echohl', ['ErrorMsg'] + a:000)
endfunction

function! z#multisub(expr, pat, sub, ...)
  let flags = a:0 ? a:1 : ''
  let pat = z#to_list(a:pat)
  if type(a:sub) == v:t_list
    let sub = a:sub
  else
    let sub = []
    for _ in pat
      let sub += [a:sub]
    endfor
  endif
  let rv = a:expr
  for [search, replace] in z#zip(pat, sub)
    let rv = substitute(rv, search, replace, flags)
  endfor
  return rv
endfunction

function! z#any(items, f) abort
  for item in a:items
    if a:f(item)
      return 1
    endif
  endfor
  return 0
endfunction

function! z#all(items, f) abort
  for item in a:items
    if !a:f(item)
      return 0
    endif
  endfor
  return 1
endfunction

function! z#find_project_dir(...) abort
  let markers = [
        \ 'Cargo.toml', 'Cargo.lock',
        \ 'node_modules', 'package.json', 'package-lock.json',
        \ 'requirements.txt',
        \ '.git',
        \ ]
  let start = a:0 ? a:1 : getcwd()
  let dir = start
  while dir != expand('~') && dir != '/'
    let path = dir .. '/'
    if z#any(markers, {d -> isdirectory(path .. d) || filereadable(path .. d)})
      return fnamemodify(dir, ':p')
    endif
    let dir = fnamemodify(dir, ':h')
    if dir == '.'
      return fnamemodify(dir, ':p')
    endif
  endwhile
  return fnamemodify(start, ':p')
endfunction

function! z#to_list(x) abort
  return type(a:x) == v:t_list ? a:x : [a:x]
endfunction

function! z#char_before_cursor() abort
  let col = col('.') - 2
  return col < 0 ? '' : getline('.')[col]
endfunction

function! z#char_after_cursor() abort
  return getline('.')[col('.') - 1]
endfunction

function! z#get_color(group, attr) abort
  return synIDattr(synIDtrans(hlID(a:group)), a:attr)
endfunction

function! z#contains(l, i) abort
  return z#any(a:l, {v -> v == a:i})
endfunction
