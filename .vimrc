" :w ++ff=unix     " E492: Not an editor command: ^M   or 'unix' or 'dos2unix'
 
set nocompatible
filetype off

let g:coc_config_home="$HOME/.vim"
let g:coc_data_home="$HOME/.vim/nvim"

set grepprg="rg\ --vimgrep\ --smart-case\ --hidden\ --follow"
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --color never --glob "!.git/*"'

if has("mac")
	let g:os=mac
elseif has("win32")
	let g:os="win"
elseif has("win32unix")
    let g:os="cygwin"
elseif has("mingw32")
    let g:os="mingw"
elseif has("bsd")
    let g:os="bsd"
elseif has("linux")
    let g:os="linux"
end

source $VIMRUNTIME/defaults.vim
source $HOME/.vim/_cscope_maps.vim
source $HOME/.vim/_func.vim
source $HOME/.vim/_plugins.vim
source $HOME/.vim/_myenv.vim
source $HOME/.vim/_coc.vim
source $HOME/.vim/_keymap.vim

if exists(expand('./.pjt.vim'))
	source expand('./.pjt.vim')
endif

"encoding
if has("gui_running")
"set enc=cp949 
  set enc=utf-8
  if has("gui_gtk2") || has('gui_gtk3')
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")

""  language message ko_kr.utf-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ko_kr.utf-8
    source $VIMRUNTIME/menu.vim

    set guifont=Consolas:h12:cANSI
    set guifontwide=Dotumche:h12:cDEFAULT
  endif
  " lang mes en_US
  set lines=50 columns=125 " initial windows size
else
  set enc=utf-8
endif

"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

set fileencodings=utf-8,cp949
set termencoding=utf-8
"set langmenu=cp949

syntax on
set ts=2
set sw=2
set hlsearch
set nu
set relativenumber

set termguicolors
colorscheme gruvbox

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
set comments=sr:/*,mb:*,ex:\*/

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

set lazyredraw
" highlight current line
set cul

" added by SGK 20190629
highlight SpellBad ctermbg=darkred ctermfg=lightgrey guibg=darkred guifg=white

"" FileType
"" enable FileType detection:
filetype on
filetype plugin on
filetype indent on " file type based indentation
"
"" recognize anything in my .Postponed directory as a news article, and anything
"" at all with a .txt extension as being human-language text [this clobbers the
"" `help' filetype, but that doesn't seem to prevent help from working
"" properly]:

augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
  autocmd BufNewFile,BufRead *.mk set filetype=make noexpandtab
  autocmd BufNewFile,BufRead makefile set filetype=make noexpandtab
  autocmd BufNewFile,BufRead Makefile set filetype=make noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
  autocmd BufNewFile,BufRead *.py set filetype=python noexpandtab
  autocmd BufNewFile,BufRead *.md set conceallevel=0
  autocmd BufNewFile,BufReadPre *.md let g:indentLine_conceallevel=0
  autocmd BufNewFile,BufReadPost .gitalias*.inc set filetype=gitconfig
augroup END

" Only enable autocommands when Vim supports them
if has("autocmd")
	""
	" Markdown Configuration
	""
	" Spellcheck in British English
	autocmd FileType markdown setlocal spell spelllang=en_gb
	" Automatically open Goyo
	" autocmd FileType markdown Goyo
	" Hide plaintext formatting and use color instead
	"autocmd FileType markdown set conceallevel=3
	autocmd FileType markdown set conceallevel=0
	" Disable cursor line and column highlight
	autocmd FileType markdown set nocursorline
	autocmd FileType markdown set nocursorcolumn
endif

let NERDChistmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
"
" NERD Tree 
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
"
" Tagbar
let g:tagbar_left=0
let g:tagbar_vertical=15
let g:tagbar_width=15
let g:tagbar_posiotion='botright'

" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
set comments=sr:/*,mb:*,ex:\*/


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="SoonGoo Kang <finegs@gmail.com>"

set lazyredraw
" highlight current line
set cul

" SuperTab
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-p>", "&omnifunc:<c-x><c-o>"]

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType python let b:coc_root_patterns = ['.pjt.vim']
autocmd FileType java let b:coc_root_patterns = ['.pjt.vim', '.classpath', '.project']
autocmd FileType c let b:coc_root_patterns = ['.pjt.vim', '.classpath', '.project']
autocmd FileType cpp let b:coc_root_patterns = ['.pjt.vim', '.classpath', '.project' ]

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" ############# air-line ##############
" Smarter tab line 활성화: 모든 파일 버퍼 출력
let g:airline#extensions#tabline#enabled = 1

" Tab line 구분자 '|' 로 설정
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Powerline-font 활성화
let g:airline_powerline_fonts = 1 

if g:os == "mingw"
	execute 'let CMAKE_GENERATOR="MinGW Makefiles"'
endif

"added by SGK 20210508
if &term == "screen"
  set t_Co=256
endif

highlight CursorLine ctermbg=Black guibg=#282828

highlight SpellBad ctermbg=DarkGrey ctermfg=white
highlight CocErrorFloat ctermfg=Yellow

" vimspector for gdb plugin
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools' ,  'CodeLLDB', 'vscode-java-debug']
"packadd! vimspector

" added by SGK 20211225
set wildmenu
set wildoptions=pum
set wildmode=full
let g:snipMate = { 'snippet_version' : 1 }

set termguicolors
colorscheme darkblue
colorscheme gruvbox

let g:cmake_root_markers = ['.project']
let g:cmake_build_dir_location = 'build'

" - Popup window (anchored to the bottom of the current window)
"let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5, 'relative': v:true, 'yoffset': 1.0 } }
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7, 'relative': v:true} }
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow'
let $FZF_DEFAULT_COMMAND .= ' -g \".git\"'
" let g:fzf_vim#preview_window = ['right,50%', 'ctrl-/']
let g:fzf_vim#preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

set splitright
set splitbelow

set ignorecase
:cabbrev h vert help


" added by finegs 230905
" This is just an example. Keep this out of version control. Check for more examples below.
let g:dbs = {
\  'db01': 'mysql://user01:user01@localhost:3306/db01'
\ }


if executable("rg")
  set grepprg=rg\ --vimgrep
endif

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --color never --glob "!.git/*"'

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set to auto read when a file is changed from the outside
set autoread

au FocusGained,BufEnter * silent! checktime
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set belloff=all
let g:indentLine_enabled = 1

let b:ale_linters = ['markdownlint', 'vale']
let b:ale_fixers = ['prettier']

" Configuration for vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
" let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
hi IndentGuideOdd guibg=red ctermbg=3
hi IndentGuideEven guibg=green ctermbg=4
