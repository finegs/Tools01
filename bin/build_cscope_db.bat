dir /b /s "C:\Programs\mingw-w64\mingw64"|findstr ".*\.[ch]" > cscope.files
dir /b /s ..|findstr ".*\.[ch]" >> cscope.files
cscope -i cscope.files

