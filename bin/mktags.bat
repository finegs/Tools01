@echo off
echo "1. Start ctags"
echo "\t 'ctags -R -n --c++-kinds=+p --extra=+f --fields=+i+K+S+l+m+a .'"
ctags -R -n --c++-kinds=+p --extra=+f --fields=+i+K+S+l+m+a .
echo "2. Complete ctags."
