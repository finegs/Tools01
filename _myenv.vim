"============= path =====================================
set path+=inc
set path+=.
set path+=..
set path+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++                                     
set path+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32                  
set path+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward                            
set path+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include                                         
set path+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed                                   
set path+=D:/Programs/mingw64/mingw64/x86_64-w64-mingw32/include
set path+=D:/Dev/git/gnuplot-gnuplot-main/src

if executable('sed')
  if executable('g++')
    let s:expr = 'g++ -Wp,-v -x c++ - -fsyntax-only 2>&1 | grep "^ " | sed "s/^ //"'
    let s:lines = systemlist(s:expr)
    for s:line in s:lines
      execute 'set path+=' . fnameescape(s:line)
    endfor
  endif
endif

"============= tags =====================================
set tags+=./tags
set tags+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/tags
set tags+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32/tags
set tags+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward/tags
set tags+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/tags
set tags+=D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed/tags
set tags+=D:/Programs/mingw64/mingw64/x86_64-w64-mingw32/include/tags


"============= syntastic =====================================
let g:syntastic_cpp_include_dirs = [ '../include', 'include', 'inc', '.']
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/x86_64-w64-mingw32/include' ]
let g:syntastic_cpp_include_dirs +=[ 'D:/Dev/git/gnuplot-gnuplot-main/src' ]


for item in ['D:\Programs\mingw64\mingw64', 'D:\Programs\zm', '.']
  let iitem = item.'\cscope.out'
  if filereadable(iitem)
	cs add iitem
  endif
endfor

