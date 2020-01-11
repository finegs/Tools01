"============= path =====================================
set path+=inc
set path+=.
set path+=..
set path+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++
set path+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include
set path+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed
set path+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/finclude
set path+=C:/Programs/mingw-w64/mingw64/include
set path+=C:/Programs/mingw-w64/mingw64/x86_64-w64-mingw32/include
set path+=C:/Programs/boost/1.69.0/include/boost-1_69
set path+=C:/Programs/wx-widgets


"============= tags =====================================
set tags+=./tags
set tags+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/tags
set tags+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/tags
set tags+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed/tags
set tags+=C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/finclude/tags
set tags+=C:/Programs/mingw-w64/mingw64/include/tags
set tags+=C:/Programs/mingw-w64/mingw64/x86_64-w64-mingw32/include/tags
set tags+=C:/Programs/boost/1.69.0/include/boost-1_69/tags
set tags+=C:/Programs/wx-widget/include/tags


"============= syntastic =====================================
let g:syntastic_cpp_include_dirs = [ '../include', 'include', 'inc', '.']
let g:syntastic_cpp_include_dirs += [ 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++']
let g:syntastic_cpp_include_dirs += [ 'C:/Programs/mingw-w64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include']
let g:syntastic_cpp_include_dirs += [ 'C:/Programs/mingw-w64/mingw64/x86_64-w64-mingw32/include']
let g:syntastic_cpp_include_dirs += [ 'C:/Programs/mingw-w64/mingw64/include']
let g:syntastic_cpp_include_dirs += [ 'C:/Download/wxWidgets-3.0.4/include' ]

