" Use system clipboard by default (the best thing by far in this vimrc)
function! ClipboardYank()
  call system('xsel --clipboard --input', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xsel --clipboard --output')
endfunction
" This also allows the ease of use of CMD+C / V
