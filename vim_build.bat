
nmake /f Make_mvc.mak clean && \
nmake /f Make_mvc.mak GUI=YES PYTHON3=D:\\Programs\\Python\\Python311 PYTHON3_VER=311 DYNAMIC_PYTHON3_DLL=python311.dll PYTHON=D:\\Programs\\Python\\Python27 && \
nmake /f Make_mvc.mak OLE=yes PYTHON3=D:\\Programs\\Python\\Python311 PYTHON3_VER=311 DYNAMIC_PYTHON3_DLL=python311.dll PYTHON=D:\\Programs\\Python\\Python27 && \
copy /Y *.exe D:\Programs\Vim\Vim90 && copy /Y tee\*.exe D:\Programs\Vim\Vim90 && copy /Y xxd\*.exe D:\Programs\Vim\Vim90
