[From](https://gist.github.com/limingjie/4975c36d13d0927613e6)
#256 colors in putty, tmux/screen and vim There is a detailed answer on stackoverflow. If you are looking for a short one, here it is.

putty

Set Connection -> Data -> Terminal-type string to xterm-256color

tmux

Add this line to ~/.tmux.conf

set -g default-terminal "screen-256color"
screen

Add this line to ~/.screenrc

term "screen-256color"
vim

Add these lines to ~/.vimrc

if &term == "screen"
  set t_Co=256
	endif
	View actural 256 colors by this script.
