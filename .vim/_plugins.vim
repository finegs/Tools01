
filetype off

call plug#begin('$HOME/.vim/plugged')

" Initialize plugin system
" Optional:
Plug 'OmniSharp/omnisharp-vim'
Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'cdelledonne/vim-cmake'
Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'jiangmiao/auto-pairs'        " pairs quotes or braket
Plug 'junegunn/fzf', { 'do': {->fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'mikelue/vim-maven-plugin'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'uzxmx/vim-widgets'
Plug 'vim-python/python-syntax'                    " Python highlighting
Plug 'vimwiki/vimwiki'                             " VimWiki 
Plug 'will133/vim-dirdiff'

call plug#end()

