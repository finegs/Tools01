" :w ++ff=unix     " E492: Not an editor command: ^M   or 'unix' or 'dos2unix'
 
set nocompatible
filetype off

source $VIM/vim90/defaults.vim
source $HOME/.vim/_cscope_maps.vim
source $HOME/.vim/_func.vim
source $HOME/.vim/_plugins.vim
source $HOME/.vim/_myenv.vim
source $HOME/.vim/_coc.vim
source $HOME/.vim/_keymap.vim

"encoding
if has("gui_running")
"set enc=cp949 
  set enc=utf-8
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")

""  language message ko_kr.utf-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ko_kr.utf-8
    source $VIMRUNTIME/menu.vim

    set guifont=Consolas:h12:cANSI
    set guifontwide=Dotumche:h12:cDEFAULT
  endif
  lang mes en_US
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
set ts=4
set sw=4
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
augroup END

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

execute 'let CMAKE_GENERATOR="MinGW Makefiles"'

"added by SGK 20210508
set t_Co=256

highlight CursorLine ctermbg=Black guibg=#282828

highlight SpellBad ctermbg=DarkGrey ctermfg=white
highlight CocErrorFloat ctermfg=Yellow

" vimspector for gdb plugin
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector

" added by SGK 20211225
set wildmenu
set wildmode=list
let g:snipMate = { 'snippet_version' : 1 }

" added by SGK 20230429
set  splitbelow splitright

let g:python_highlight_all = 1

set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar

" fzf layout
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

 " " Make Ripgrep ONLY search file contents and not filenames
" command! -bang -nargs=* Rg
 "  \ call fzf#vim#grep(
 "  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
 "  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
 "  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
 "  \   <bang>0)

" " Ripgrep advanced
" function! RipgrepFzf(query, fullscreen)
 "  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
 "  let initial_command = printf(command_fmt, shellescape(a:query))
 "  let reload_command = printf(command_fmt, '{q}')
 "  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
 "  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
