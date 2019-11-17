highlight! hlWord gui=underline cterm=underline

function! s:toggle() abort
  let pat = '\<'.expand('<cword>').'\>'
  if z#char_after_cursor() =~ '\s'
        \ || z#any(getmatches(), {m -> m.group == 'hlWord' && m.pattern == pat})
    windo 2match none
  elseif z#char_after_cursor() =~ '\w'
    windo execute '2match hlWord /'.pat.'/'
  endif
endfunction

nnoremap <silent> <C-Space> :call <SID>toggle()<CR>
nnoremap <silent> <Space>
      \  :if v:hlsearch
      \\|   execute 'nohlsearch \| windo 2match none'
      \\| else
      \\|   call <SID>toggle()
      \\| endif<CR>
" this ↑ can't be a function because `v:hlsearch` is reset when a function ends
