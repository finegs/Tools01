
" let s:comment_map = {
"     \   "c": '\/\/',
"     \   "cpp": '\/\/',
"     \   "go": '\/\/',
"     \   "java": '\/\/',
"     \   "javascript": '\/\/',
"     \   "lua": '--',
"     \   "scala": '\/\/',
"     \   "php": '\/\/',
"     \   "python": '#',
"     \   "ruby": '#',
"     \   "rust": '\/\/',
"     \   "sh": '#',
"     \   "desktop": '#',
"     \   "fstab": '#',
"     \   "conf": '#',
"     \   "profile": '#',
"     \   "bashrc": '#',
"     \   "bash_profile": '#',
"     \   "mail": '>',
"     \   "eml": '>',
"     \   "bat": 'REM',
"     \   "ahk": ';',
"     \   "vim": '"',
"     \   "tex": '%',
"     \ }

" function! ToggleComment()
"     if has_key(s:comment_map, &filetype)
"         let comment_leader = s:comment_map[&filetype]
"         if getline('.') =~ "^\\s*" . comment_leader . " " 
"             " Uncomment the line
"             execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
"         else 
"             if getline('.') =~ "^\\s*" . comment_leader
"                 " Uncomment the line
"                 execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
"             else
"                 " Comment the line
"                 execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
"             end
"         end
"     else
"         echo "No comment leader found for filetype"
"     end
" endfunction

" function! Comment()
" 	let ft = &filetype
" 	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
" 		silent s/^/\#/
" 	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
" 		silent s:^:\/\/:g
" 	elseif ft == 'tex'
" 		silent s:^:%:g
" 	elseif ft == 'vim'
" 		silent s:^:\":g
" 	endif
" endfunction

" function! Uncomment()
" 	let ft = &filetype
" 	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
" 		silent s/^\#//
" 	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
" 		silent s:^\/\/::g
" 	elseif ft == 'tex'
" 		silent s:^%::g
" 	elseif ft == 'vim'
" 		silent s:^\"::g
" 	endif
" endfunction

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

function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

function! PutTermPanel(buf, side, size) abort
  " new term if no buffer
  if a:buf == 0
    term
  else
    execute "sp" bufname(a:buf)
  endif
  " default side if wrong argument
  if stridx("hjklHJKL", a:side) == -1
    execute "wincmd" "J"
  else
    execute "wincmd" a:side
  endif
  " horizontal split resize
  if stridx("jkJK", a:side) >= 0
    if ! a:size > 0
      resize 6
    else
      execute "resize" a:size
    endif
    return
  endif
  " vertical split resize
  if stridx("hlHL", a:side) >= 0
    if ! a:size > 0
      vertical resize 6
    else
      execute "vertical resize" a:size
    endif
  endif
endfunction

function! ToggleTerminal(side, size) abort
  let tpbl=[]
  let closed = 0
  let tpbl = tabpagebuflist()
  " hide visible terminals
  for buf in filter(range(1, bufnr('$')), 'bufexists(bufname(v:val)) && index(tpbl, v:val)>=0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      silent execute bufwinnr(buf) . "hide"
      let closed += 1
    endif
  endfor
  if closed > 0
    return
  endif
  " open first hidden terminal
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)<0')
    if getbufvar(buf, '&buftype') ==? 'terminal'
      call PutTermPanel(buf, a:side, a:size)
      return
    endif
  endfor
  " open new terminal
  call PutTermPanel(0, a:side, a:size)
endfunction

" An action can be a reference to a function that processes selected lines
function! MyBuild_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
	copen
	cc
endfunction

" alias for vertical diffsplit
function! AliasVerticalDiffSplit(filepath)
	execute "vertical diffsplit ".fnameescape(a:filepath)
endfunction

command! -nargs=1 -complete=file Avd call AliasVerticalDiffSplit(<q-args>)


function! JavaStartDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function! JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))
endfunction

function!_func#myrg(query, path, fullscreen=1)
  let l:path = a:path
  if empty(l:pat)
    let l:path = getcwd()
  endif

  echo printf(" query : \%s, paht : \%s, fullscreen : \%d", a:query, l:path, l:fullscreen)

  let command_fmt = 'rg -uu --column --line-number --no-heading --color=always --smart-case %s %s||true'
  let initial_cmd = printf(command_fmt, shellescape(a:query), fnameescape(f:path))
  let reload_cmd = printf(command_fmt, '{q}', fnameescape(f:path))
  let spec = {'optionss': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], '--preview-windows': 'hidden,right:95%,>150(up,95%)'}
  call fzf#vim#grep(initial_cmd, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=+ -complete=dir -bang Mrg call _func#myrg(<f-args>, <bang>0)

function GetVisualSelection()
  let raw_search = @"
  let @/=substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction
xnoremap // ""y:call GetVisualSelection()<bar>:set hls<cr>

function! RgRunner(...)
  let command = 'rg --column --line-number --no-heading --color=always --smart-case '
  if a:0 >= 1
    let command = command . '-g ' . a:1 . ' '
  endif
  return command
endfunction

command! -bang -nargs=* Rrg
  \ call fzf#vim#grep(RgRunner(<f-args>).shellescape(""), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

