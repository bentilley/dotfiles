" Redux
" augment javascript files that use redux
function! filetypedetection#redux()
  let s:redux_import_pattern = "from \"\\(react-\\)\\=redux\";"
  let s:dispatch_pattern = "dispatch(.*)"
  let s:mapstate_pattern = "mapStateToProps"
  let s:mapdispatch_pattern = "mapDispatchToProps"
  " let s:action_creator_pattern = ""

  let s:redux_import_found = search(s:redux_import_pattern, 'nw')
  let s:dispatch_found = search(s:dispatch_pattern, 'nw')
  let s:mapstate_found = search(s:mapstate_pattern, 'nw')
  let s:mapdispatch_found = search(s:mapdispatch_pattern, 'nw')

  if s:redux_import_found || s:dispatch_found || s:mapstate_found || s:mapdispatch_found
    return 1
  else
    return 0
  endif
endfunction

" C++ Catch Testing Library
" augment C++ files that use catch
function! filetypedetection#catch()
  let s:catch_library_import_pattern = '^#include.*catch.hpp[>"]$'
  let s:catch_import_found = search(s:catch_library_import_pattern, 'nw')
  return s:catch_import_found
endfunction
