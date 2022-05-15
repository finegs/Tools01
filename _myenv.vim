"============= path =====================================

let s:lines = []
"if executable('sed')
if (executable('cl'))
  let s:expr = 'echo $INCLUDE'
  let s:lines = split(system('echo $INCLUDE'), ';')

  if(len(s:lines) < 1)
  	let s:lines = add(s:lines, 'D:/Programs/VS2017/WDExpress/VC/Tools/MSVC/14.16.27023/include')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/NETFXSDK/4.6.1/include/um')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.19041.0/ucrt')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.19041.0/shared')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.19041.0/um')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.19041.0/winrt')
  	let s:lines = add(s:lines, 'C:/Program\\\ Files\\\ (x86)/Windows\\\ Kits/10/include/10.0.19041.0/cppwinrt')
  else
  	echo '#### len(s:lines):'len(s:lines)
  endif
  "  if executable('g++')
elseif executable('g++')
  let s:expr = 'echo |g++ -Wp,-v -x c++ - -fsyntax-only 2>&1 | grep "^ " | sed "s/^ //"'
  let s:lines = systemlist(s:expr)

  "	let s:lines = add(s:lines, $MINGW_HOME)
  let s:lines = add(s:lines, 'inc')
  let s:lines = add(s:lines, '.')
  let s:lines = add(s:lines, 'D:/Programs/glibc/glibc')
endif
"endif
"execute 'setlocal path+='. fnameescape("C:\Program Files (x86)\Windows Kits\10\include\10.0.19041.0\**")

for s:line in s:lines
"============= path =====================================
"      execute 'setlocal path+=' . shellescape(s:line)
      "execute 'setlocal path+=' . fnameescape(s:line)
  execute 'setlocal path+=' . s:line
"============= tags =====================================
"
"	  let s:tagfile = s:line.'\tags'
"	  if filereadable(s:tagfile)
"		  execute 'set tags+='.s:tagfile
"	  endif
"	  let s:csf = s:line.'/cscope.out'
"	  if filereadable(s:csf)
"	   cs add s:csf
"	  endif
endfor

"============= tags =====================================
"if filereadable('./tags')
"	set tags+=./tags
"endif


"============= syntastic =====================================
"let g:syntastic_cpp_include_dirs = [ '../include', 'include', 'inc', '.']
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Programs/mingw64/mingw64/x86_64-w64-mingw32/include' ]
"let g:syntastic_cpp_include_dirs +=[ 'D:/Dev/git/gnuplot-gnuplot-main/src' ]

let s:items = []
if len(s:lines) > 0

	for s:line in s:lines
		let s:items = add(s:items, s:line)
	endfor

else

	let s:items = add(s:items, $MINGW_HOME)
	let s:items = add(s:items, 'D:\Programs\glibc\glibc')

endif


for s:item in s:items
  let s:csf = s:item.'\cscope.out'
  if filereadable(s:csf)
	execute 'cs add '.s:csf
  endif

  let s:tagfile = s:item.'\tags'
  if filereadable(s:tagfile)
	  execute 'set tags+='.s:tagfile
  endif

endfor

