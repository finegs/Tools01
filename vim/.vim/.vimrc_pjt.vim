"============= path =====================================
set path+=.
set path+=D:/Dev/git\embedded-sht\embedded-common
set path+=D:/Dev/git\embedded-sht\embedded-common\hw_i2c/sample-implementations/linux_user_space
set path+=D:/Dev/git\embedded-sht\sht-common
set path+=D:/Dev/git\embedded-sht\sht3x


"============= tags =====================================
set tags+=./tags
set tags+=D:/dev/git/embedded-sht/embedded-common/tags
set tags+=D:/dev/git/embedded-sht/embedded-common/hw_i2c/sample-implementations\linux_user_space/tags
set tags+=D:/dev/git/embedded-sht/sht-common/tags
set tags+=D:/dev/git/embedded-sht/sht3x/tags


"============= syntastic =====================================
let g:syntastic_cpp_include_dirs = [ '../include', 'include', 'inc', '.']
let g:syntastic_cpp_include_dirs += [ 'D:/Dev/git/embedded-sht/embedded-common' ]
let g:syntastic_cpp_include_dirs += [ 'D:/Dev/git/embedded-sht/embedded-common/hw_i2c/sample-implementations/linux_user_space' ]
let g:syntastic_cpp_include_dirs += [ 'D:/Dev/git/embedded-sht/sht-common' ]
let g:syntastic_cpp_include_dirs += [ 'D:/Dev/git/embedded-sht/sht3x' ]


if filereadable("cscopes.out")
  cs add .
endif
