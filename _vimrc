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
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'


call vundle#end()

colorscheme darkblue
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set cindent
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

set tags=tags
set tags+=$MINGW_HOME/include/tags
set tags+=$MINGW_HOME/x86_64-w64-mingw32/include/tags
set tags+=$MSYS_HOME/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++/tags
set tags+=$MSYS_HOME/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++/x86_64-pc-msys/tags
set tags+=$MSYS_HOME/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++/backward/tags
set tags+=$MSYS_HOME/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/tags
set tags+=$MSYS_HOME/usr/lib/gcc/x86_64-pc-msys/7.4.0/include-fixed/tags
set tags+=$MSYS_HOME/usr/include/tags
set tags+=$MSYS_HOME/usr/lib/../lib/../include/w32api/tags

"set tags+=~/.vim/ctags/tags
"set tags+=~/.vim/ctags/cpp
"set tags+=~/.vim/ctags/gl
"set tags+=~/.vim/ctags/gtk

" NERD Tree 
let NERDChistmasTree=0
let NERDTreeWinSize=15
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" Tagbar
let g:tagbar_left=1
let g:tagbar_vertical=15
let g:tagbar_width=15

"Syntastic Setting
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_cpp_checkers = ['gcc', 'clang_check']
let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_cpp_checkers = 'g++'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++1y'
let g:syntastic_error_symbol = 'X'
let g:syntastic_c_include_dirs=[ '/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++', '/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++/x86_64-pc-msys', '/usr/lib/gcc/x86_64-pc-msys/7.4.0/include/c++/backward', '/usr/lib/gcc/x86_64-pc-msys/7.4.0/include', '/usr/lib/gcc/x86_64-pc-msys/7.4.0/include-fixed', '/usr/include', '/usr/lib/../lib/../include/w32api']
let g:syntastic_cpp_check_header = 1
" g++ Include path here, separate by ',' wrap with [, ] 
" g++ -E -x c++ - -v < nul

nmap <Tab> <ESC><C-W>w
nmap <S-TAB> <ESC><C-W><C-P>
map <F2> :w<CR><ESC>
nmap <F2> :w<CR><ESC>
imap <F2> <ESC> :w<CR>i
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
"map <F5> :make clean all<CR>
"map <F4> :!ctags -R -c++kinds=+p -fields=+ias -extra=+q .<CR>
map <F4> :!ctags -R -extra=+f .<CR>

map <F5> :cn<CR>
map <S-F5> :cp<CR>
map <C-F5> :cl<CR>

map <F7> :make debug<CR>
map <S-F7> :make clean debug<CR>
map <C-F7> :make release<CR>

"map <F11> <C-t>
"map <F12> <C-]>

map <C-8> <ESC>:SyntasticCheck<CR>
map <C-9> <ESC>:NERDTree<CR>
map <C-0> <ESC>:TagbarToggle<CR>

map <F3> <ESC><C-]>
map <S-F3> <ESC><C-t>

"map for move lines
map <S-Up> :m-2<CR>
map <S-Down> :m+1<CR>
imap <S-Up> <ESC>:m-2<CR>
imap <S-Down> <ESC>:m+1<CR>

nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv



"Call Plugins
":TagbarToggle
":NERDTree

" Remove Include serach file paths
" ctags -R -n --fields=+i+K+S+l+m+a --exclude=src/react/conf-srch/node_modules
set complete-=i

let g:ctrlp_user_command = 'ag %s -i -nocolor --nogroup -- hidden \
                                     \ --ignore .git
                                     \ --ignore .svn
                                     \ --ignore .hg
                                     \ --ignore .DS_Store
                                     \ --ignore "**/*.pyc"
                                     \ -g ""'


" For Syntastic Debug ## Comment out later
let g:syntastic_debug=0
