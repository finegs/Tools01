"# Tool01"
0. Download VIM (already compliled with python)
 0.1) Install VIM : https://github.com/vim/vim-win32-installer/releases/tag/v8.1.1587 64bit Installer

0. set System  Properties on systempropertiesadvanced
   >set MSYS_HOME=D:\Programs\msys64
   >set MINGW_HOME=%MSYS_HOME%\mingw64

1. Install 'chocolatey'  : Software Management for Windows
  1.1 open cmd.exe with administratro privileges
  1.2 paste to cmd.exe and Enter

  "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass
  -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET
  "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

2. git clone Vundle
	D:\..>git clone https://github.com/VundleVim/Vundle.vim.git D:\Programs\Vim\vimfiles\bundle\Vundle.vim

3. set _vimrc
  
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
##########################
   set rtp+=D:\Programs\Vim\vimfiles\bundle\Vundle.vim

   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}

   " All of your Plugins must be added before the following line
   call vundle#end()            " required
#######################
   filetype plugin indent on    " required

4. >vim +PluginInstall +qall
   or :PluginInstall after vim execuring..

"# Tool02" 

1. VIM : 8.1.1023_x64
2. Python 3.7.3
3. LLVM 8.0.0 x64
4. Git 2.21.0
5. cmake 3.14.3


#############################################################
cd D:\Dev\git\boost
bootstrap --prefix=D:\Programs\boost\boost.1.72.0 gcc
./b2 --reconfigure --without-python --without-locale toolset=gcc variant=debug link=shared threading=multi runtime-link=shared address-model=64 install



### for MSVC ###
b2 -j4 -a --toolset=msvc-14.21 variant=debug,release link=static threading=multi address-model=32 lib32
b2 -j4 -a --toolset=msvc-14.21 variant=debug,release link=static threading=multi address-model=64 lib64

#################

############################################################


### For ncurses in msys2 ###
## 0. open msys2 
Windows KEy -> Ctrl+R -> cmd -> run with administrator -> start msys2
## 1. git clone
git clone 	git://ncurses.scripts.mit.edu/ncurses.git
## 2. cd ncurses
cd ncurses
## 3. configgure with options
configure --enable-term-driver --enable-sp-funcs
## 4. make (be patient)
make
## 5. make install
make install

## 6. Use library with  below

-- source --
#include <ncurses.h>

-- link --
-lncurses

#############################################################


