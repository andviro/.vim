setlocal spell nonumber colorcolumn= nocursorline nowrap
noremap <buffer> <silent> <F8> :Pandoc #pdf<CR>
noremap <buffer> <silent> <F9> :!pandoc -s % -o %:r.html<CR>
noremap <buffer> <silent> <F10> :!pandoc -s % -o %:r.odt<CR>
inoreab <buffer> ююю ```
augroup Markdown 
    au!
    au BufEnter *.md :LiteDFM
    au BufLeave *.md :LiteDFMClose
augroup END

