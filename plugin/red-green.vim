hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=black guibg=green
hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red
hi BlueBar  term=reverse ctermfg=white ctermbg=blue guifg=white guibg=blue

function g:Bar(type, msg)
  if a:type == "red"
    echohl RedBar
  elseif a:type == "green"
    echohl GreenBar
  else
    echohl BlueBar
  endif
  set ch=2
  echomsg a:msg . repeat(" ", &columns - strlen(a:msg))
  echohl None
endfunction

command Red :call g:Bar("red", "FUCKED")
command Green :call g:Bar("green", "GREAT")
command Blue :call g:Bar("blue", "RUNNING...")
