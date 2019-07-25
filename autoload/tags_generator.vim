scriptencoding utf-8

if !exists('g:loaded_tags_generator')
  finish
endif
let g:loaded_tags_generator = 1

let s:save_cpo = &cpo
set cpo&vim


function! s:output_result(ch, exit_status, ...) abort
  if !a:exit_status
    echomsg s:success_message
  else
    echoerr s:failure_message
  endif
endfunction


function! s:generate_tags_job_start(tags_command) abort
  if has('nvim')
    let job = jobstart(
          \ a:tags_command,
          \ {'on_exit': function('s:output_result')}
          \ )
  else
    let job = job_start(
          \ a:tags_command,
          \ {'exit_cb': function('s:output_result')}
          \ )
  endif
  return l:job
endfunction


function! tags_generator#generate_tags() abort
  let s:success_message = 'Success generating ctags file'
  let s:failure_message = 'Failure generating ctags file'

  let tags_command = get(g:, 'tags_command', 'ctags -R')
  call s:generate_tags_job_start(l:tags_command)
endfunction


function! tags_generator#generate_gtags() abort
  let s:success_message = 'Success generating GTAGS file'
  let s:failure_message = 'Failure generating GTAGS file'

  let tags_command = get(g:, 'gtags_command', 'gtags')
  call s:generate_tags_job_start(l:tags_command)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
