
if !exists("runtests_enabled")
  let runtests_enabled = 0
endif


autocmd BufWritePost,FileWritePost *.js call g:RunTests()

function s:SetEnabled(val)
  let g:runtests_enabled = a:val
  set ch=1
endfunction

command RunTestsOn :call <SID>SetEnabled(1)
command RunTestsOff :call <SID>SetEnabled(0)

function g:RunTests()
  if g:runtests_enabled == 0
    return
  endif

  let vim_cmd = 'vim --remote-send "<ESC>:call g:ParseTestsOutput()<CR>"'
  let output = system('./test.sh > test.log 2>&1 && ' . vim_cmd . ' || ' . vim_cmd . ' &')
  echo "Running tests..."
endfunction

function g:ParseTestsOutput()
  " execute "cgetfile test.log | copen"
  for line in readfile("test.log")
    " JSTD output
    if line =~ "Total"
      if line =~ "Total 0"
        call g:Bar("blue", line)
      elseif line =~ "Fails: 0" && line =~ "Errors: 0"
        call g:Bar("green", line)
      else
        call g:Bar("red", line)
      endif
    elseif line =~ "test.*assertion.*failure"
      if line =~ "0 tests"
        call g:Bar("blue", line)
      elseif line =~ "0 failures"
        call g:Bar("green", line)
      else
        call g:Bar("red", line)
      endif
    endif
  endfor
endfunction
