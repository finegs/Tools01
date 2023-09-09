

filetype off
call plug#begin('$HOME/.vim/plugged')

" Make sure you use single quotes
" Use release branch (recommend)
"
"Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'dmerejkowsky/vim-ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'

"{{ The Basics }}
" Plug 'gmarik/Vundle.vim'                           " Vundle
Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
Plug 'frazrepo/vim-rainbow'
"{{ File management }}
Plug 'vifm/vifm.vim'                               " Vifm
" Plug 'scrooloose/nerdtree'                         " Nerdtree
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
Plug 'vimwiki/vimwiki'                             " VimWiki 
Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
"{{ Tim Pope Plugins }}
Plug 'tpope/vim-surround'                          " Change surrounding marks
"{{ Syntax Highlighting and Colors }}
Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
Plug 'vim-python/python-syntax'                    " Python highlighting
Plug 'ap/vim-css-color'                            " Color previews for CSS
"{{ Junegunn Choi Plugins }}
Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

" Optional:
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'

Plug 'cdelledonne/vim-cmake'
"Plug '~/my-prototype-plugin'
"
Plug 'tpope/vim-fugitive'
" Initialize plugin system

Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

call plug#end()

filetype plugin indent on
