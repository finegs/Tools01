source $VIMRUNTIME/vimrc_example.vim
source $VIM/_func.vim
behave mswin

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

set rtp+=$HOME/.vim/bundle/Vundle.vim/
set rtp+=$HOME/.vim/bundle/vim-cmake-syntax

call vundle#begin('$HOME/.vim/bundle/')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
" Added by SGK 20190629
Plugin 'pboettch/vim-cmake-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

colorscheme darkblue
set nowrap
" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier

" set UTF-8 encoding

if has("gui_running")
  set enc=utf-8
  language message ko_kr.utf-8
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ko_kr.utf-8
  source $VIMRUNTIME/menu.vim
else
  set enc=utf-8
endif

set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set cindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
"set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.

set textwidth=180
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
set comments=sr:/*,mb:*,ex:\*/

set path+=inc
set path+=.
set path+=..
set path+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++
set path+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32
set path+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward
set path+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include
set path+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed
set path+=C:/Programs/msys64/mingw64/x86_64-w64-mingw32/include
set path+=C:/Programs/boost/1_70_0/include/boost-1_70

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl

set tags+=tags
set tags+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/tags
set tags+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32/tags
set tags+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward/tags
set tags+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/tags
set tags+=C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed/tags
set tags+=C:/Programs/msys64/mingw64/x86_64-w64-mingw32/include/tags
set tags+=C:/Programs/boost/1_70_0/include/boost-1_70/tags

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
let mapleader=","
let g:mapleader=","
set lazyredraw
" highlight current line
set cul

" added by SGK 20190629
highlight SpellBad ctermbg=darkred ctermfg=gray guibg=darkred guifg=white


",vi => show edit tab .vimrc
nnoremap <leader>e :tabe $MYVIMRC<CR> 
",src => reload .vimrc
nnoremap <leader>src :source $MYVIMRC<CR>

",q => Quit
map <leader><S>q <ESC><ESC>:q<CR>

"jk => esc, Escape insert mode
"inoremap jk <ESC>

""""""""""""""""""""""""""
"   Moving tab Setting
""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <Tab> <C-W>w
nmap <S-Tab> <C-W><C-P>

map <F2> :w<CR><ESC>
nmap <F2> :w<CR><ESC>
imap <F2> <ESC> :w<CR>i
" in normal mode F2 will save the file
" in insert mode F2 will exit insert, save, enters insert again
" switch between header/source with F4
map <F3> <ESC><C-]>
map <S-F3> <ESC><C-t>
map <C-F3> :ts<CR>


map <F4> <ESC>:e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
"map <F4> :!ctags -R -c++kinds=+p -fields=+ias -extra=+q .<CR>
"map <S-F4> :!ctags -R -n --c++-kinds=+p --extra=+f --fields=+i+K+S+l+m+a .<CR>
" ctags -R -n --fields=+i+K+S+l+m+a --exclude=src/react/conf-srch/node_modules
"map <S-F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <S-F4> :!ctags -R -n --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <S-F4> :!ctags -R -n --c++-kinds=+p --fields=+i+K+S+l+m+a --extra=+q .<CR>
" Remove Include search file paths
" ctags -R -n --fields=+i+K+S+l+m+a --exclude=src/react/conf-srch/node_modules
" map <S-F4> <ESC>:ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <S-F4> <ESC>:!ctags -R -h=".h.hpp.c.cpp.cxx.hxx" --c++-kinds=+p --extra=+q --fields=+iaS --language-force=C++ .<CR>
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5

map <F5> :cn<CR>
map <S-F5> :cp<CR>
map <C-F5> :cl<CR>

" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> <ESC>:make debug<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
map <C-F7> <ESC>:make release<CR>
" goto definition with F12
map <S-F12> :setlocal spell! spelllang=en_us<CR>

map <C-0> <ESC>:NERDTreeToggle<CR>
map <C-9> <ESC>:TagbarToggle<CR>
map <C-8> <ESC>:term<CR>
map <C-7> <ESC>:YcmDiag<CR>

map <F7> <ESC>:make debug<CR>
map <S-F7> <ESC>:make clean debug<CR>
map <C-F7> <ESC>:make release<CR>

map <S-F12> :setlocal spell! spelllang=en_us<CR>

map <C-0> <ESC>:NERDTreeToggle<CR>
map <C-9> <ESC>:TagbarToggle<CR>

map <S-Down> :m+1<CR>
map <S-Up> :m-2<CR>
"map for move lines
vnoremap <S-Up> :m-2<CR>
vnoremap <S-Down> :m+1<CR>
imap <S-Up> <ESC>:m-2<CR>
imap <S-Down> <ESC>:m+1<CR>

nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv


" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  syntax off
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

let NERDChistmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

" NERD Tree 

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
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++2a'
let g:syntastic_error_symbol = 'X'


let g:syntastic_c_include_dirs = ['C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++']
let g:syntastic_c_include_dirs += ['C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32']
let g:syntastic_c_include_dirs += ['C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward']
let g:syntastic_c_include_dirs += ['C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include']
let g:syntastic_c_include_dirs += ['C:/Programs/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include-fixed']
let g:syntastic_c_include_dirs += ['C:/Programs/msys64/mingw64/x86_64-w64-mingw32/include']
let g:syntastic_c_include_dirs += [ '../include/', 'include/', 'inc/', 'C:/Programs/boost/boost_inc', './' ]


"Call Plugins
":TagbarToggle
":NERDTree

" Remove Include search file paths
" ctags -R -n --fields=+i+K+S+l+m+a --exclude=src/react/conf-srch/node_modules
set complete-=i

let g:ctrlp_user_command = 'ag %s -i -nocolor --nogroup -- hidden \
                                     \ --ignore .git
                                     \ --ignore .svn
                                     \ --ignore .hg
                                     \ --ignore .DS_Store
                                     \ --ignore "**/*.pyc"
                                     \ -g ""'


"YouCompleteMe
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = "C:/Programs/LLVM/LLVM/bin/clangd.exe"
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
"let g:ycm_global_ycm_extra_conf = [ "~/.vim/*" ]
let g:ycm_clangd_uses_ycmd_caching = 1
"let g:ycm_clangd_binary_path = "D:\Programs\LLVM\LLVM\bin\clangd.exe"

let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_warning_symbol = '>*'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_clangd_args = []
"let g:ycm_clangd_args = [ '-limit-results=0', '-log=verbose', '-function-arg-placeholders', '-j=4', '-color'  ]

"nnoremap <leader>p :e ./.ycm_extra_conf.py<CR>


let g:ycm_min_num_of_chars_for_completion = 1			  " 기본값은 2입니다. 문자가 1개 입력되면 그 때부터 자동완성을 시작합니다. 쓰지 않을려면 99같은 큰 값을 넣어줍니다.
let g:ycm_auto_trigger = 1								  " 기본값은 1입니다. '.'이나 '->'을 받으면 자동으로 목록들을 출력해주죠.
let g:ycm_collect_identifiers_from_tags_files = 1		  " tags 파일을 사용합니다. 성능상 이익이 있는걸로 알고 있습니다.
let g:ycm_filetype_whitelist = { '*': 1 }				  " 화이트 리스트를 설정합니다.
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \}											  " 블랙 리스트를 설정합니다.

nnoremap <leader>g  :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd  :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gi  :YcmCompleter GoToImprecise <CR>
nnoremap <leader>gt  :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>
nnoremap <leader>gr  :YcmCompleter GoToReferences<CR>
"nnoremap <leader>p :YcmCompleter GetParent<CR>
nnoremap <leader>gy  :YcmCompleter GetTypeImprecise<CR>


function MyFont()
    if has('gui_running')
        "set guioption-=T " No Toolbar
        colorscheme darkblue
        set lines=45 columns=120 linespace=0
        if has('gui_win32')
            set guifont=Consolas:h12:cANSI
        else
            set guifont=Consolas\ 10
        endif
    endif
endfunction

" FileType
" enable FileType detection:
filetype on
filetype plugin on
filetype indent on " file type based indentation

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
  autocmd BufNewFile,BufRead *.mk set filetype=make
augroup END

autocmd FileType mail set formatoptions+=t textwidth=72 " enable wrapping in mail
autocmd FileType human set formatoptions-=t textwidth=0 " disable wrapping in txt

" for C-like  programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c,cpp,java set formatoptions+=ro
autocmd FileType c set omnifunc=ccomplete#Complete

" fixed indentation should be OK for XML and CSS. People have fast internet
" anyway. Indentation set to 2.
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2

" two space indentation for some files
autocmd FileType vim,lua,nginx set shiftwidth=2 softtabstop=2

" for CSS, also have things in braces indented:
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" add completion for xHTML
autocmd FileType xhtml,html set omnifunc=htmlcomplete#CompleteTags

" add completion for XML
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" ensure normal tabs in assembly files
" and set to NASM syntax highlighting
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" added by SGK 20190621 : Syntax Off for diff
if &diff
  syntax off
endif


" added by SGK 20190622 : highlight color changed
"hi SpellBad term=bold,undercurl ctermfg=lightgrey ctermbg=darkgrey
hi SpellBad term=undercurl,bold ctermbg=lightgrey ctermfg=darkblue cterm=undercurl,bold gui=undercurl,bold


" added by SGK 20191225
map  <leader>/ :call Comment()<CR>
map  <leader>// :call Uncomment()<CR>
