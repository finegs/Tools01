@echo off
rem gcc -M $* | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
rem gcc -I%BOOST_INC% -I%BOOST_INC%/boost -Iinc -M * | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
rem gcc -I%BOOST_INC% -I%BOOST_INC%/boost -Iinc -M * | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --extra=+q --fields=+iaSl --language-force=C++
SET USE_HEADER=N
SET /P USE_HEADER=Use Header Files in Current Directory (Y/N:Defaut(N))
IF ("%USE_HEADER%") == ("Y") (
	gcc -I%BOOST_INC% -I%BOOST_INC%/boost -Iinc -M * | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ --exclude=*~,*bak
) ELSE (
	ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ --exclude=*~,*bak .
)

