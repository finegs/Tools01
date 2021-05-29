#!/bin/bash

dir_list=(
 	"/mingw64/include/c++/10.2.0"
 	"/mingw64/include/c++/10.2.0/x86_64-w64-mingw32"
 	"/mingw64/include/c++/10.2.0/backward"
 	"/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include"
 	"/mingw64/include"
 	"/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include-fixed"
 	"/mingw64/x86_64-w64-mingw32/include"
	"/c/programs/wxWidgets/wxWidgets-3.1.5"
)

find . -name '*.[cpphppxx]' -print > cscope.files

pushd .

for ddd in "${dir_list}"; do
	if [ -d "$ddd" ]; then
		echo "# --find $ddd"

		find ${ddd} -name '*.[cpphppxx]' -print >> cscope.files
	fi

	echo "Enter $ddd"

	pushd .

	cd $ddd

	ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=tags --exclude=cscope.out -h=".h.hpp.hxx.c.cpp.cxx" .

	popd

done

popd

ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=tags --exclude=cscope.out -h=".h.hpp.hxx.c.cpp.cxx" .

cscope -b -k -q

