if exists('g:loaded_ctrlp_branch_modified') && g:loaded_ctrlp_branch_modified
  finish
endif
let g:loaded_ctrlp_branch_modified = 1

let s:branch_modified_var = {
\  'init':   'ctrlp#branch_modified#init()',
\  'exit':   'ctrlp#branch_modified#exit()',
\  'accept': 'ctrlp#acceptfile',
\  'lname':  'branch_modified',
\  'sname':  'branch_modified',
\  'type':   'path',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:branch_modified_var)
else
  let g:ctrlp_ext_vars = [s:branch_modified_var]
endif

let s:self_path = expand("<sfile>")

function! ctrlp#branch_modified#init()
  let l:cmd = '"$(dirname '.shellescape(s:self_path).')/../../lib/branch_modified.sh"'
  if exists('g:ctrlp#modified#excludes')
    let l:cmd .= ' | grep -v '.shellescape(g:ctrlp#modified#excludes)
  endif
  return split(system(l:cmd), "\n")
endfunc

function! ctrlp#branch_modified#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#branch_modified#id()
  return s:id
endfunction
