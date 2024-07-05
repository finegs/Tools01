
",vi => show edit tab .vimrc
nnoremap <leader>mvrc :e $MYVIMRC<CR> 
",src => reload .vimrc
nnoremap <leader>src :source $MYVIMRC<CR>

",q => Quit
map <leader>qq <Esc><Esc>:q!<CR>
map <leader>qa <Esc><Esc>:qa!<CR>

"jk => esc, Escape insert mode
"inoremap jk <Esc>

""""""""""""""""""""""""""
"   Moving tab Setting
""""""""""""""""""""""""""
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

nmap <Tab> <C-W>w
nmap <S-Tab> <C-W><C-P>

nmap <space>ww :w<CR><Esc>
nmap <space>wa :wa<CR><Esc>
" in normal mode F2 will save the file
" in insert mode F2 will exit insert, save, enters insert again
" switch between header/source with F4
"map <F3> <Esc><C-]>
map <S-F3> <Esc><C-t>
map <C-F3> :ts<CR>

map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

map <S-F4> <Esc>:!ctags -R --c++-kinds=+p --extra=+q --fields=+l --language-force=C++ --exclude=*~,*.html,*bak* .<CR>

"jk => esc, Escape insert mode
"inoremap jk <Esc>

map <F5>   :cn<CR>
map <S-F5> :cp<CR>
map <C-F5> :cl<CR>

" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> <Esc>:make debug<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
map <C-F7> <Esc>:make release<CR>
" goto definition with F12
map <S-F12> :setlocal spell! spelllang=en_us<CR>

nnoremap <space>0 <Esc>:NERDTreeToggle<CR>
nnoremap <space>9 <Esc>:TagbarToggle<CR>
nnoremap <space>v8 <Esc>:vertial :botright :term<CR>
nnoremap <space>8 <Esc>:term<CR>


if has('gui_running')
	" map <space>0 <Esc>:NERDTreeToggle<CR>
	map <space>9 <Esc>:TagbarToggle<CR>
	" OpenTerminal below
	map <space>8 <Esc>:call ToggleTerminal('J', 30)<CR>
	map <space>* <Esc>:call ToggleTerminal('L', 50)<CR>

	"map for move lines
	map <M-Down> :m+1<CR>
	map <M-Up> :m-2<CR>
	imap <M-k> <Esc>:m-2<CR>
	imap <M-j> <Esc>:m+1<CR>

	nnoremap <M-k>   :<C-u>silent! move-2<CR>==
	nnoremap <M-j>	 :<C-u>silent! move+<CR>==
	vnoremap <M-k>	 :<C-u>silent! m-2<CR>
	vnoremap <M-j>	 :<C-u>silent! m+1<CR>
	xnoremap <M-k>   :<C-u>silent! '<,'>move-2<CR>gv=gv
	xnoremap <M-j>	 :<C-u>silent! '<,'>move'>+<CR>gv=gv

else
	nnoremap <space>0 <Esc>:NERDTreeToggle<CR>
	nnoremap <space>9 <Esc>:TagbarToggle<CR>
	" nnoremap <space>8 <Esc>:term<CR>
	nnoremap <space>8 <Esc>:call ToggleTerminal('J', 30)<CR>
	nnoremap <space>* <Esc>:call ToggleTerminal('L', 50)<CR>

	nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
	nnoremap ,<Down>	 :<C-u>silent! move+<CR>==
	vnoremap ,<Up>	 :<C-u>silent! m-2<CR>
	vnoremap ,<Down>	 :<C-u>silent! m+1<CR>
	xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
	xnoremap ,<Down>	 :<C-u>silent! '<,'>move'>+<CR>gv=gv
endif

if has('gui_running')
	map <M-Down> :m+1<CR>
	map <M-Up> :m-2<CR>
	"map for move lines
	vnoremap <M-Up> :m-2<CR>
	vnoremap <M-Down> :m+1<CR>
	imap <M-Up> <Esc>:m-2<CR>
	imap <M-Down> <Esc>:m+1<CR>
else
	nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
	nnoremap ,<Down> :<C-u>silent! move+<CR>==
	xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
	xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
endif

" in diff mode we use the spell check keys for merging
if &diff
" diff settings
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <space><Left> <Plug>(coc-diagnostic-prev)
nmap <silent> <space><Right> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Buffer Switch
map bn :bn<CR>
map bp :bp<CR>
map bd :bd<CR>
" GoTo buffer with buffer number
nnoremap <Leader>bb :ls<CR>:b<space>

" Tab Switch
map gtn :tabnext<CR>
map gtp :tabprevious<CR>
map gtd :tabclose<CR>
" GoTo Tab with Tab number
nnoremap <Leader>gtt :tabs<CR>:b<space>
" GoTo buffer with buffer number
nnoremap gtl :tabs<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call Show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Formatting selected code.
xmap <leader>ft  <Plug>(coc-format-selected)
nmap <leader>ft  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>cas  <Plug>(coc-codeaction-selected)
nmap <leader>cas  <Plug>(coc-codeaction-selected)
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


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
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>aa  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent><nowait> <space>ll  :<C-u>CocList<CR>
nnoremap <silent><nowait> <space>ee  :<C-u>CocCommand explorer<CR>
" Show commands.
nnoremap <silent><nowait> <space>mm  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <space>oo  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ss  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><nowait> <space>rs  :<C-u>CocRestart<CR>

nnoremap <silent><nowait> <space>st :<C-u>CocCommand  java.action.showTypeHierarchy<CR>
nnoremap q <c-v>

" Debugger remaps
let mapleader = "\\"
let g:mapleader="\\"
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" VimspectorInstall
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-java-debug' ]

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <Tab>
		\ coc#pum#visible() ? coc#pum#next(1):
		\ CheckBackspace() ? "\<Tab>" :
		\ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" added by SGK 20211224
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
" Use <c-space> to trigger completion: >
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	" inoremap <silent><expr> <c-@> coc#refresh()
	inoremap <silent><expr> <c-space> coc#refresh()
endif

" < Use <CR> to confirm completion, use: >
inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" < To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use: >
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Toggle menu bar/tool bar
map <C-F1> <Esc>:call ToggleGUICruft()<CR>
map <C-F2> <Esc>:ALEToggle<CR>

" Toggle Comment  
map  <C-/> gcc
vmap <C-/> gc
imap <C-/> <C-o>gc

" Help of Document 
nnoremap <expr> K (&filetype is# 'vim' ? (':help ' . fnameescape(expand('<cword>')) . "\n") : ':call Show_documentation()' . "\n")
"
" added by SGK 20230429

if has('gui_running')
	nnoremap <silent> <C-Left> :vertical resize +3<CR>
	nnoremap <silent> <C-Right> :vertical resize -3<CR>
	nnoremap <silent> <C-Up> :resize +3<CR>
	nnoremap <silent> <C-Down> :vertical resize -3<CR>
else
	nnoremap <Leader><Left> 	:vertical resize -3<CR>
	nnoremap <Leader><Right> 	:vertical resize +3<CR>
	nnoremap <Leader><Up> 		:resize -3<CR>
	nnoremap <Leader><Down> 	:resize +3<CR>
endif

nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd da\"=substitute(@@,"'\\\|\"", "","g")<CR>P

nmap <Leader><TAB> <Plug>(fzf-maps-n)
xmap <Leader><TAB> <Plug>(fzf-maps-x)
omap <Leader><TAB> <Plug>(fzf-maps-o)
imap <Leader><TAB> <Plug>(fzf-maps-i)

imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-l> <Plug>(fzf-complete-line)

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Toggle terminal - bottom
nnoremap <silent> yot :call ToggleTerminal('J', 20)<CR>

" Toggle terminal - right
nnoremap <silent> yo<c-t> :call ToggleTerminal('L', 60)<CR>

nnoremap <C-P> :Files<CR>
nnoremap <space>ff :Files<CR>
nnoremap <space>bb :Buffers<CR>
nnoremap <silent> <space>tat :Ag <C-R><C-W><CR>
nnoremap <silent> <space>tt :Rg <CR>
nnoremap <silent> <space>tw :Rg <C-R><C-W><CR>
nnoremap <silent> <space>cmd :Commands<CR>
nnoremap <silent> <space>mks :Marks    <CR>
nnoremap <silent> <space><Tab> :Maps  <CR>
nnoremap <silent> <space>hc :History: <CR>
nnoremap <silent> <space>hs :History/ <CR>
nnoremap <silent> <space>ts :Tags<CR>


imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" " Toggle terminal - bottom
nnoremap <silent> yot :call <Plug>ToggleTerminal('J', 6)<CR>

" " Toggle terminal - right
nnoremap <silent> yo<c-t> :call <Plug>ToggleTerminal('L', 60)<CR>

if !(has('win32') || has('win64'))
	nmap <leader>cg <Plug>(CMakeGenerate)
	nmap <leader>cb <Plug>(CMakeBuild)
	nmap <leader>ci <Plug>(CMakeInstall)
	nmap <leader>cs <Plug>(CMakeSwitch)
	nmap <leader>cq <Plug>(CMakeClose)
endif

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" For JavaDebugger attach to defualt java debugger server port(5005 or set
" with user input)
nmap <LocalLeader>jds :call JavaStartDebug()<CR>


" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
