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
  if has('nvim')
    let l:job = jobstart(
          \ get(g:, 'tags_command', 'ctags -R'),
          \ {'on_exit': function('s:output_result')}
          \ )
  else
    let l:job = job_start(
          \ get(g:, 'tags_command', 'ctags -R'),
          \ {'exit_cb': function('s:output_result')}
          \ )
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
