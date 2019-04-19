set nocompatible
filetype off
" SET RUNTIMEPATH
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

" Call VUNDLE 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'


call vundle#end()

colorscheme darkblue
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells visualbell t_vb=
set hls
set nowrap

set textwidth=120
"set t_Co=256
syntax on
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */

set path+=.,..,../..,./*,./*/*,.../*,~/,~/**,/usr/include/*

set tags+=$MINGW_HOME/include/tags
set tags+=$MINGW_HOME/x86_64-w64-mingw64/include/tags
set tags+=$MSYS_HOME/usr/include/tags
set tags+=./tags
"set tags+=~/.vim/ctags/tags
"set tags+=~/.vim/ctags/cpp
"set tags+=~/.vim/ctags/gl
"set tags+=~/.vim/ctags/gtk
"Syntastic Setting
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <F2> :w<CR>
nmap <F2> :w<CR>
imap <F2> <ESC> :w<CR>i
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F5> :make clean all<CR>
"map <F4> :!ctags -R -c++kinds=+p -fields=+ias -extra=+q .<CR>
map <F4> :!ctags -R -extra=+f .<CR>
map <F6> :cp<CR>
map <F7> :cn<CR>
map <S-F7> :make clean all<CR>
map <F11> <C-t>
map <F12> <C-]>
map <S-F2> <ESC>:NERDTree<CR>
map <S-F3> <ESC>:TagbarToggle<CR>

