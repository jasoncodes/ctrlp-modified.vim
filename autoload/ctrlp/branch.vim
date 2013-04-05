if exists('g:loaded_ctrlp_branch') && g:loaded_ctrlp_branch
  finish
endif
let g:loaded_ctrlp_branch = 1

let s:branch_var = {
\  'init':   'ctrlp#branch#init()',
\  'exit':   'ctrlp#branch#exit()',
\  'accept': 'ctrlp#branch#accept',
\  'lname':  'branch',
\  'sname':  'branch',
\  'type':   'path',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:branch_var)
else
  let g:ctrlp_ext_vars = [s:branch_var]
endif

function! ctrlp#branch#init()
  return split(system("git diff $(git merge-base origin/HEAD HEAD).. --name-only | sort -u | xargs find 2> /dev/null"), "\n")
endfunc

function! ctrlp#branch#accept(mode, str)
  call ctrlp#exit()
  execute "e ".fnameescape(a:str)
endfunction

function! ctrlp#branch#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#branch#id()
  return s:id
endfunction
