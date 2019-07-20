scriptencoding utf-8

if exists('g:loaded_tags_generator')
  finish
endif
let g:loaded_tags_generator = 1

let s:save_cpo = &cpo
set cpo&vim

command! GenerateTags call tags_generator#generate_tags()

let &cpo = s:save_cpo
unlet s:save_cpo
