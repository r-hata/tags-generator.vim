scriptencoding utf-8

if exists('g:loaded_tags_generator')
  finish
endif
let g:loaded_tags_generator = 1

let s:save_cpo = &cpo
set cpo&vim

if executable('ctags')
  command! GenerateTags  call tags_generator#generate_tags()

  nnoremap <silent> <Plug>(tags-generator) :<C-u>GenerateTags<CR>

  " Default key mappings
  if !hasmapto('<Plug>(tags-generator)')
        \ && (!exists('g:tags_generator_no_default_key_mappings')
        \ || !g:tags_generator_no_default_key_mappings)
    silent! nmap <unique> <Leader>t <Plug>(tags-generator)
  endif
endif

if executable('gtags')
  command! GenerateGTAGS call tags_generator#generate_gtags()

  nnoremap <silent> <Plug>(tags-generator-g) :<C-u>GenerateGTAGS<CR>

  " Default key mappings
  if !hasmapto('<Plug>(tags-generator-g)')
        \ && (!exists('g:tags_generator_no_default_key_mappings')
        \ || !g:tags_generator_no_default_key_mappings)
    silent! nmap <unique> <Leader>g <Plug>(tags-generator-g)
  endif
endif

let &cpo = s:save_cpo
unlet s:save_cpo
