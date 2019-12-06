let s:ClassProto = { "name": "" }

function! s:ClassProto.Debug(object)
  let l:info = "DEBUG: "
  let l:info = l:info . string(a:object)
  return l:info
endfunction

function! s:ClassProto.New(name)
  let l:object = copy(s:ClassProto)
  let l:object.name = a:name
  return l:object
endfunction

let my_instance = s:ClassProto.New("my_instance")

" copy my_instance debug info to system copy buffer [crazyshit]
let @+ = my_instance.Debug(my_instance)
