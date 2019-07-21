scriptencoding utf-8

if exists('g:loaded_tags_generator')
  finish
endif
let g:loaded_tags_generator = 1

let s:save_cpo = &cpo
set cpo&vim

if executable('ctags')
  " Options
  if !exists('g:tags_generator#default_map')
    let g:tags_generator#default_map = 1
  endif

  command! GenerateTags  call tags_generator#generate_tags()

  if g:tags_generator#default_map == 1
    nmap <Leader>t :GenerateTags<CR>
  endif
endif

if executable('gtags')
  " Options
  if !exists('g:tags_generator#default_map')
    let g:tags_generator#default_map = 1
  endif

  command! GenerateGTAGS call tags_generator#generate_gtags()

  if g:tags_generator#default_map == 1
    nmap <Leader>g :GenerateGTAGS<CR>
  endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo
