" Tlist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File=1 
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1  

" Ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
