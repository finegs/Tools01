@echo off
rem gcc -M $* | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
gcc -I%BOOST_INC% -I%BOOST_INC%/boost -Iinc -M * | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
