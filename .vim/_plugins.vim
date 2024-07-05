
filetype off

call plug#begin('$HOME/.vim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
Plug 'nathanaelkane/vim-indent-guides'

Plug 'airblade/vim-gitgutter'
if g:os == "linux"
	Plug 'cdelledonne/vim-cmake'
endif
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'        " pairs quotes or braket
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'junegunn/vim-github-dashboard'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-surround'
Plug 'mikelue/vim-maven-plugin'
Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
Plug 'uzxmx/vim-widgets'
Plug 'chrisbra/csv.vim'
Plug 'kristijanhusak/vim-packager', { 'type': 'opt' }
Plug 'will133/vim-dirdiff'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'uzxmx/vim-widgets'
Plug 'vim-python/python-syntax'                    " Python highlighting
Plug 'dense-analysis/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'vim-python/python-syntax'                    " Python highlighting

let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot' 
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'frazrepo/vim-rainbow'
Plug 'vifm/vifm.vim'                               " Vifm
Plug 'vimwiki/vimwiki'                             " VimWiki 
Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
Plug 'ap/vim-css-color'                            " Color previews for CSS
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'github/copilot.vim'
Plug 'tpope/vim-eunuch'
Plug 'itchyny/vim-gitbranch' 
Plug 'hdiniz/vim-gradle'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'

call plug#end()

