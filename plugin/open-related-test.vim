function s:FileSuffix(suffix, dir, root, ext)
  return a:dir . '/' . a:root . a:suffix . '.' . a:ext
endfunction

function s:OpenRelatedTestFile()
  let dir = expand('%:h')
  let root = expand('%:t:r')
  let ext = expand('%:e')

  let extensions = [ext, 'coffee']
  let directories = [dir, substitute(dir, '^src\|^lib\|^js', 'test', '')]
  let suffices = ['Spec', 'Specs', 'Test', 'Tests', '.spec', '.test']

  for extension in extensions
    for directory in directories
      for suffix in suffices
        let try = s:FileSuffix(suffix, directory, root, extension)
        if (filereadable(try))
          wincmd w
          exec 'e ' . try
          return
        endif
      endfor
    endfor
  endfor

endfunction

command OpenRelatedTest :call <SID>OpenRelatedTestFile()
map <leader>t :OpenRelatedTest<CR>

