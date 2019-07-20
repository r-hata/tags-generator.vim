scriptencoding utf-8

if !exists('g:loaded_tags_generator')
  finish
endif
let g:loaded_tags_generator = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:output_result(ch, exit_status, ...) abort
  let success_message = 'Success generating a tags file'
  let failure_message = 'Failure generating a tags file'

  if !a:exit_status
    echomsg l:success_message
  else
    echoerr l:failure_message
  endif
endfunction


function! tags_generator#generate_tags() abort
  let tags_command = get(g:, 'tags_command', 'ctags -R')
  if has('nvim')
    let job = jobstart(
          \ l:tags_command,
          \ {'on_exit': function('s:output_result')}
          \ )
  else
    let job = job_start(
          \ l:tags_command,
          \ {'exit_cb': function('s:output_result')}
          \ )
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
