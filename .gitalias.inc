; # TODO 
;   1. copy '.gitalias.inc' to $HOME
;    .  xNix : >cp ~/dev/git/tools01/.gitalias.inc ~
;    .  Windows : >copy {tools01 git path}/.gitalias.inc %USERPROFILE%/
;   2. add following text to ~/.gitconfig
;    ``` 
;    [include]]
;       path = ~/.gitalias.inc
;       
;    ```
;  ---

[user]
	name = finegs
	email = finegs@gmail.com

[alias]
    # one-line log
    ll = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short
    l3 = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short -n 3
    l10 = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short -n 10

    a = add
    ap = add -p
    c = commit --verbose
    ca = commit -a --verbose
    cm = commit -m
    cam = commit -a -m
    m = commit --amend --verbose
    
    d = diff
    ds = diff --stat
    dc = diff --cached

    s = status -s
    co = checkout
    cob = checkout -b
    # list branches sorted by last modified
    b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

    # list aliases
    la = "!git config -l | grep alias | cut -c 7-"

    com="checkout master"
    st="stash"
    stl="stash list"
    #rl="ref log"
    # [alias sample](https://gist.github.com/HarshadRanganathan/eb48dd68133054fdd9db2de8b426f411.js)
