function FindAndReplace(arg1, arg2)
  exec 'grep ' . a:arg1
  exec 'cfdo %s/' . a:arg1 . '/' . a:arg2 . '/gc'
endfunction

command -nargs=* -bar FindAndReplace execute 'call FindAndReplace(<f-args>)'
