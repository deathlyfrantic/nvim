let s:test_buffer = -1

function! s:python() abort
  if executable('pytest')
    return 'pytest'
  endif
endfunction

function! s:javascript() abort
  let package_json = findfile('package.json', ';')
  if package_json == ''
    return
  endif
  let package = json_decode(readfile(package_json))
  let scripts = get(package, 'scripts', {})
  if get(scripts, 'test', '') != ''
    return 'npm test'
  endif
endfunction

function! s:new_test_window() abort
  let size = winheight(0) / 3
  execute printf('rightbelow %snew', size)
  let s:test_buffer = bufnr('%')
  autocmd BufDelete <buffer> let s:test_buffer = -1
  autocmd TermClose <buffer> call <SID>scroll_to_end()
  nnoremap <buffer> q :bd!<CR>
endfunction

function! s:ensure_test_window() abort
  let test_buf_windows = win_findbuf(s:test_buffer)
  if len(test_buf_windows) < 1
    call s:new_test_window()
  endif
endfunction

function! s:scroll_to_end() abort
  let current_window = win_getid()
  for window in win_findbuf(s:test_buffer)
    call win_gotoid(window)
    normal G
  endfor
  call win_gotoid(current_window)
endfunction

function! s:run_tests(cmd) abort
  call s:ensure_test_window()
  let current_window = win_getid()
  call win_gotoid(win_findbuf(s:test_buffer)[0])
  set nomodified
  call termopen(a:cmd)
  call win_gotoid(current_window)
endfunction

function! s:orchestrate_tests() abort
  " account for 'javascript.jsx'
  let l:ft = (&ft =~? 'javascript') ? 'javascript' : &ft
  try
    let Runner = function(printf('s:%s', l:ft))
  catch /^Vim\%((\a\+)\)\=:E700/ " runner doesn't exist
    echomsg printf('No tests available for filetype "%s"', &ft)
    return
  endtry
  let current_window = win_getid()
  let cmd = Runner()
  if type(cmd) == type('')
    call s:run_tests(cmd)
  else
    echomsg printf("Test runner '%s' invalid; didn't return command.", Runner)
  endif
  call win_gotoid(current_window)
endfunction

command! RunTests call <SID>orchestrate_tests()
nnoremap <Plug>(run-tests) :RunTests<CR>