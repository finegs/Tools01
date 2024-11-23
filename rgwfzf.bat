@echo off
rg --line-number --with-filename . --field-match-separator=: | fzf --delimiter : --preview "bat --color=always {1} --highlight-line {2}" --preview-window ~8,+{2}-5
