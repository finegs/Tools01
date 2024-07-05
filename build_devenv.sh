#!/bin/sh
DIRS="/D/Programs/msys64/mingw64/include/c++/10.2.0/ 
		/D/Programs/msys64/mingw64/include/c++/10.2.0/x86_64-w64-mingw32/ 
		/D/Programs/msys64/mingw64/include/c++/10.2.0/backward/ 
		/D/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include/ 
		/D/Programs/msys64/mingw64/include/ 
		/D/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include-fixed/ 
		/D/Programs/msys64/mingw64/x86_64-w64-mingw32/include/ 
		/D/Programs/glibc/glibc/" 

pushd .

#cd /D/Programs/msys64/mingw64/include/c++/10.2.0
#cd /D/Programs/msys64/mingw64/include/c++/10.2.0/x86_64-w64-mingw32
#cd /D/Programs/msys64/mingw64/include/c++/10.2.0/backward
#cd /D/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include
#cd /D/Programs/msys64/mingw64/include
#cd /D/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/10.2.0/include-fixed
#cd /D/Programs/msys64/mingw64/x86_64-w64-mingw32/include


for ddir in $DIRS
do
	echo "Entering : $ddir "
	cd $ddir
	echo "Current Path : $PWD"
	if [[ ! -f "cscope.out" ]]; then

		echo "[1-1] Building cscope.out : $ddir"
		#find $ddir -name *.[cpphpp] -fprint cscope.files "%f\n"
		find $ddir -name '*.[cpphpp]' -print > cscope.files
		#find $ddir -name '*.[cpphpp]' -fprintf cscope.files "%p\n"
		cscope -b -q -i cscope.files
		echo "[1-2] Built cscope.out : $ddir"
	fi

	if [[ ! -f "tags" ]]; then
		echo "[2-1] Building tags : $ddir"
		ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=tags -h=[.h.hpp.c.cpp.h++.hxx.cxx.H.hh] .
		echo "[2-2] Built tags : $ddir"
	fi

done

popd

#find $PWD -name '*.[cpphpp]' -fprintf cscope.files "%p\n"
find $PWD -name '*.[cpphpp]' -print > cscope.files

echo "Building cscope.out : $PWD"
cscope -b -q -k -i cscope.files
echo "Built cscope.out : $PWD"


echo "Building tags : $PWD"
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=tags -h=[.h.hpp.c.cpp.h++.hxx.cxx.H.hh]  .
echo "Built tags : $PWD"

