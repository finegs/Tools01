" :w ++ff=unix     " E492: Not an editor command: ^M   or 'unix' or 'dos2unix'
 
set nocompatible
filetype off

source $VIM/vim82/defaults.vim
source $VIM/_cscope_maps.vim
source $VIM/_func.vim
source $VIM/_plugins.vim
source $VIM/_myenv.vim
source $VIM/_coc.vim

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

    set guifont=Consolas:h10:cANSI
    set guifontwide=Dotumche:h8:cDEFAULT
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

colorscheme darkblue

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

" colorscheme womba" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
set comments=sr:/*,mb:*,ex:\*/


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
let mapleader=","
let g:mapleader=","
set lazyredraw
" highlight current line
set cul

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" added by SGK 20190629
highlight SpellBad ctermbg=darkred ctermfg=lightgrey guibg=darkred guifg=white

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
nmap <S-TAB> <C-W><C-P>

map <F2> :w<CR><ESC>
nmap <F2> :w<CR><ESC>
imap <F2> <ESC> :w<CR><ESC>
" in normal mode F2 will save the file
" in insert mode F2 will exit insert, save, enters insert again
" switch between header/source with F4
"map <F3> <ESC><C-]>
map <S-F3> <ESC><C-t>
map <C-F3> :ts<CR>
"map <F3> :YcmCompleter GoTo<CR>

map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

map <S-F4> <ESC>:!ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ --exclude=*~,*.html,*bak* .<CR>

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
"map <C-7> <ESC>:YcmDiag<CR>


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
  set spellfile=$VIM/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
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
let g:tagbar_left=1
let g:tagbar_vertical=15
let g:tagbar_width=15

" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
"set comments=sl:/*,mb:\ *,elx:\ */
set comments=sr:/*,mb:*,ex:\*/


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
let mapleader=","
let g:mapleader=","
set lazyredraw
" highlight current line
set cul

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" added by SGK 20190629
highlight SpellBad ctermbg=darkred ctermfg=lightgrey guibg=darkred guifg=white

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
nmap <S-TAB> <C-W><C-P>

map <F2> :w<CR><ESC>
nmap <F2> :w<CR><ESC>
imap <F2> <ESC> :w<CR><ESC>
" in normal mode F2 will save the file
" in insert mode F2 will exit insert, save, enters insert again
" switch between header/source with F4
"map <F3> <ESC><C-]>
map <S-F3> <ESC><C-t>
map <C-F3> :ts<CR>
"map <F3> :YcmCompleter GoTo<CR>

map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

map <S-F4> <ESC>:!ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ --exclude=*~,*.html,*bak* .<CR>

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
"map <C-7> <ESC>:YcmDiag<CR>


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
  set spellfile=$VIM/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
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
let g:tagbar_left=1
let g:tagbar_vertical=15
let g:tagbar_width=15



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap q <c-v>
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

highlight CursorLine ctermbg=Black

highlight SpellBad ctermbg=DarkGrey ctermfg=white
highlight CocErrorFloat ctermfg=Yellow

" vimspector for gdb plugin
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

