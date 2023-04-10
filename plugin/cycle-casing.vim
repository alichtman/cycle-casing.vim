" Title:        cycle-casing.vim
" Description:  A plugin to cycle casing of selected text from upper to lower to title.
" Last Change:  09 Apr 2023
" Maintainer:   Aaron Lichtman <https://github.com/alichtman>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:cycle-casing-plugin")
    finish
endif

" Cycle casing of selected text from upper to lower to title
" https://vim.fandom.com/wiki/Switching_case_of_characters
function! CycleCasing(str) abort
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

" Cycle casing of selected text
if get(g:, "cycle_casing_mapping_enabled", 1)
    vnoremap <c-u> y:call setreg('', CycleCasing(@"), getregtype(''))<CR>gv""Pgv
endif
