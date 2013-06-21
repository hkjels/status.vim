
"
" status.vim
" ==========
"
" __Simplistic vim statusline__
"
" Author: Henrik Kjelsberg <hkjels@me.com> (http://take.no/)
" Version: 0.0.1
"


set statusline =

" Branch
if exists(':fugitive#statusline')
  set statusline+=%#identifier#
  set statusline+=%1*
  set statusline+=%{Branch()}
  set statusline+=%*
endif

" Filename
set statusline+=%#identifier#
set statusline+=%1*
set statusline+=[%t]

" Flags
set statusline+=%2*
set statusline+=%h%m%r%w
set statusline+=%*

" Warning when file encoding is not utf-8
set statusline+=%#warningmsg#
set statusline+=%2*
set statusline+=\%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" Warning on syntax-error
if exists(':SyntasticCheck')
  let g:syntastic_enable_signs = 1
  set statusline+=%#warningmsg#
  set statusline+=%2*
  set statusline+=\%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

" Row & column
set statusline+=%*
set statusline+=%=
set statusline+=%<
set statusline+=%0*\ row:%l/%L\ \ col:%03c
set statusline+=%*

fun! Branch()
  let s:status = fugitive#statusline()
  if (s:status != '')
    return strpart(s:status, 4, strlen(s:status) - 5)
  endif
  return ''
endfun

