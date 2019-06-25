0.0
 1) Install VIM : https://github.com/vim/vim-win32-installer/releases/tag/v8.1.1587 64bit Installer

0. set System  Properties on systempropertiesadvanced
   >set MSYS_HOME=D:\Programs\msys64
   >set MINGW_HOME=%MSYS_HOME%\mingw64

1. Install 'chocolatey'  : Software Management for Windows
  >@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass
  -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET
  "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

2. git clone Vundle
  >git clone https://github.com/VundleVim/Vundle.vim.git D:\Programs\Vim\vimfiles\bundle\Vundle.vim

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

