function! SetTab(n)
    let &tabstop=a:n
    let &shiftwidth=a:n
    let &softtabstop=a:n
    set expandtab
    set autoindent
    set smartindent
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

nnoremap <c-z> <nop>

autocmd BufRead,BufNewFile * SetTab 4

let g:EasyMotion_startofline = 1
"inoremap <silent><expr> <TAB>
"        \ coc#pum#visible() ? coc#_select_confirm() :
"        \ "\<Tab>"

