
",vi => show edit tab .vimrc
nnoremap <leader>mvrc :e $MYVIMRC<CR> 
",src => reload .vimrc
nnoremap <leader>src :source $MYVIMRC<CR>

",q => Quit
map <leader><S>q <Esc><Esc>:q<CR>

"jk => esc, Escape insert mode
"inoremap jk <Esc>

""""""""""""""""""""""""""
"   Moving tab Setting
""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <Tab> <C-W>w
nmap <S-Tab> <C-W><C-P>

map <F2> :w<CR><Esc>
nmap <F2> :w<CR><Esc>
imap <F2> <Esc> :w<CR><Esc>
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


if has('gui_running')
	" map <Space>0 <Esc>:NERDTreeToggle<CR>
	map <Space>9 <Esc>:TagbarToggle<CR>
	map <Space>8 <Esc>:vertial :botright :term<CR>

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

	nnoremap <Space>9 <Esc>:TagbarToggle<CR>
	nnoremap <Space>8 <Esc>:term<CR>

	nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
	nnoremap ,<Down>	 :<C-u>silent! move+<CR>==
	vnoremap ,<Up>	 :<C-u>silent! m-2<CR>
	vnoremap ,<Down>	 :<C-u>silent! m+1<CR>
	xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
	xnoremap ,<Down>	 :<C-u>silent! '<,'>move'>+<CR>gv=gv
endif

" nnoremap <C-p> :Files<Cr>

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
" diff setting
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Buffer Switch
map gn :bn<CR>
map gp :bp<CR>
map gx :bd<CR>
" GoTo buffer with buffer number
nnoremap <Leader>b :ls<CR>:b<Space>

" Use K to show documentation in preview window.
nnoremap <silent> K :call Show_documentation()<CR>

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
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent><nowait> <space>e  :<C-u>CocCommand explorer<CR>
" Show commands.
nnoremap <silent><nowait> <space>m  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

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
map <C-/> gcc
vmap <C-/> gc
imap <C-/> <C-o>gc

" Help of Document 
nnoremap <expr> K (&filetype is# 'vim' ? (':help ' . fnameescape(expand('<cword>')) . "\n") : ':call Show_documentation()' . "\n")
"
" added by SGK 20230429

if has('gui_running')
	nnoremap <slient> <C-Left> :vertical resize +10<CR>
	nnoremap <slient> <C-Right> :vertical resize -10<CR>
	nnoremap <slient> <C-Up> :resize +10<CR>
	nnoremap <slient> <C-Down> :resize -10<CR>
else
	nnoremap <Leader><Left> 	:vertical resize -10<CR>
	nnoremap <Leader><Right> 	:vertical resize +10<CR>
	nnoremap <Leader><Up> 		:resize -10<CR>
	nnoremap <Leader><Down> 	:resize +10<CR>
endif

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

nnoremap <C-P> :Buffers<CR>
nnoremap <Space>ff :Files<CR>
nnoremap <Space>bl :BLines<CR>
nnoremap <Space>ll :Lines<CR>
nnoremap <Leader><Tab> :Maps<CR>
nnoremap <Leader>cmd :Commands<CR>
nnoremap <Leader>mks :Marks<CR>
nnoremap <Leader>ts :Tags<CR>
nnoremap <silent> <Space>hc :History: <CR>
nnoremap <silent> <Space>hs :History/ <CR>
nnoremap <silent> <Space>ts :Tags<CR>

nnoremap <silent> <Space>agc :Ag!<C-r>=Escape(expand('<cword>'))<CR><CR>
nnoremap <silent> <Space>rgc :Rg!<C-r>=Escape(expand('<cword>'))<CR><CR>
nnoremap <silent> <Space>ag  :Ag -q<CR>
nnoremap <silent> <Space>rg  :Rg -q<CR>
" noremap <silent> <Space>ft :FZF -q <C-R>=GetVisualSelection()<CR><CR>
" vnoremap <silent> <Space>ft :FZF -q <C-R>=GetVisualSelection()<CR><CR>
" vnoremap <silent> <Space>ag :Ag -q <C-R>=GetVisualSelection()<CR><CR>
" vnoremap <silent> <Space>tt :Rg -q <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>cg :CMakeGenerate<cr>
nmap <Leader>cb :CMakeBuild<cr>

" " Toggle terminal - bottom
" nnoremap <silent> yot :call <Plug>ToggleTerminal('J', 6)<CR>

" " Toggle terminal - right
" nnoremap <silent> yo<c-t> :call <Plug>ToggleTerminal('L', 60)<CR>

nmap <leader>cg <Plug>(CMakeGenerate)
nmap <leader>cb <Plug>(CMakeBuild)
nmap <leader>ci <Plug>(CMakeInstall)
nmap <leader>cs <Plug>(CMakeSwitch)
nmap <leader>cq <Plug>(CMakeClose)

