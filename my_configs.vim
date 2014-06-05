" Tlist
if has("mac") || has("macunix")
    let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
elseif has("win16") || has("win32")

elseif has("linux")
    let Tlist_Ctags_Cmd='/usr/bin/ctags'
endif

let Tlist_Show_One_File=1 
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1  

" Toggle Tlist just as NERDTree
map <silent> <leader>tl :TlistToggle<cr>

" Ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

" CScope

function Do_CsTag()
    if(executable("cscope") && has("cscope") )
        if(has('win32'))
            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > cscope.files"
        endif
        silent! execute "!cscope -b"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

map <C-F11> :call Do_CsTag() <CR>

" ShortCuts
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

" Cscope comes first than CTags
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set csverb
end
