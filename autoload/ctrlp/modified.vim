if exists('g:loaded_ctrlp_modified') && g:loaded_ctrlp_modified
  finish
endif
let g:loaded_ctrlp_modified = 1

let s:modified_var = {
\  'init':   'ctrlp#modified#init()',
\  'exit':   'ctrlp#modified#exit()',
\  'accept': 'ctrlp#acceptfile',
\  'lname':  'modified',
\  'sname':  'modified',
\  'type':   'path',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:modified_var)
else
  let g:ctrlp_ext_vars = [s:modified_var]
endif

let s:self_path = expand("<sfile>")

function! ctrlp#modified#init()
  return split(system('"$(dirname '.shellescape(s:self_path).')/../../lib/modified.sh"'), "\n")
endfunc

function! ctrlp#modified#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#modified#id()
  return s:id
endfunction
