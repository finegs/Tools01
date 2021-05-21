
call plug#begin('$VIM/vimfiles/plugged')

" Make sure you use single quotes
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'puremourning/vimspector'

"Plug '~/my-prototype-plugin'
" Initialize plugin system
call plug#end()

