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

[difftool]
# tool = vimdirdiff 

[diff]
# tool = vimdiff
  tool = nvimdiff

[difftool "vimdirdiff"]
  prompt = false
  cmd = vim -f '+next' '+execute \"DirDiff\" argv(0) argv(1)' $LOCAL $REMOTE

[difftool "nvimdiff"]
  cmd = "nvim -d \"$LOCAL\"  \"$REMOTE\""
  prompt = false

[alias]

  ##
  # One letter alias for our most frequent commands.
  #
  # Guidelines: these aliases do not use options, because we want
  # these aliases to be easy to compose and use in many ways.
  ##

  a = add
  b = branch
  c = commit
  d = diff
  f = fetch
  g = grep
  l = log

  m = merge
  o = checkout
  p = pull
  r = remote
  s = status
  st = status
  w = whatchanged

  ##
  # Short aliases for our frequent commands.
  #
  # Guidelines:
  #
  #  * Generally speaking, the alias should be in the same
  #    order as the command name followed by its options.
  #
  #    * Right: fb = foo --bar
  #    * Wrong: bf = foo --bar
  ##

  ### add ###

  # add all
  aa = add --all

  # add by patch - looks at each change, and asks if we want to put it in the repo.
  ap = add --patch

  # add just the files that are updated.
  au = add --update

  ### branch ###

  # branch - edit the description
  be = branch --edit-description

  # branch and only list branches whose tips are reachable from the specified commit (HEAD if not specified).
  bm = branch --merged

  # branch and only list branches whose tips are not reachable from the specified commit (HEAD if not specified).
  bnm = branch --no-merged

  ### commit ###

  # commit - amend the tip of the current branch rather than creating a new commit.
  ca = commit --amend

  # commit - amend the tip of the current branch, and do not edit the message.
  can = commit --amend --no-edit

  # commit - amend the tip of the current branch, and edit the message.
  cam = commit --amend --message

  # commit interactive
  ci = commit --interactive

  # commit with a message
  cm = commit --message

  ### checkout ###

  # checkout - update the working tree to match a branch or paths. [same as "o" for "out"]
  co = checkout

  ### cherry-pick ###

  # cherry-pick - apply the changes introduced by some existing commits; useful for moving small chunks of code between branches.
  cp = cherry-pick

  # cherry-pick without making a commit, and when when recording the commit, append a line that says "(cherry picked from commit ...)"
  cp-nx = cherry-pick --no-commit -x

  ### diff ###

  # diff - show changes not yet staged
  dc = diff --cached

  # diff - changes about to be commited
  ds = diff --staged

  # diff - show changes but by word, not line
  dw = diff --word-diff

  ### clean ###

  # clean everything to be pristine
  cleanest = clean -ffdx

  ### grep ###

  # grep with grouping of the output lines
  gg =  grep --break --heading --line-number

  ### log ###

  # log with a text-based graphical representation of the commit history.
  lg = log --graph

  # log with one line per item.
  lo = log --oneline

  # log with patch generation.
  lp = log --patch

  # log with items appearing in topological order, i.e. descendant commits are shown before their parents.
  lt = log --topo-order

  # log key - our favorite way to show our key performance indicators, i.e. our most useful summary.
  lk = log --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'%Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Creset %Cblue%G?%Creset'

  # log latest - show the 10 most recent lines using `lk`
#  ll = log -n 10 --graph --topo-order --abbrev-commit --date=short --decorate --all --boundary --pretty=format:'%Cgreen%ad'

  ## ls-files ##

  # ls-files - show information about files in the index and the working tree; like Unix "ls" command.
  ls = ls-files

  # ls-ignored -  list files that git has ignored.
  ls-ignored = ls-files --others --i --exclude-standard

  ### merge ###

  # merge but without autocommit, and with a commit even if the merge resolved as a fast-forward.
  me = merge --no-commit --no-ff

  ### pull ###

  # pull if a merge can be resolved as a fast-forward, otherwise fail.
  pf = pull --ff-only

  # pull with rebase - to provide a cleaner, linear, bisectable history.
  #
  # To integrate changes between branches, you can merge or rebase.
  #
  # When we use "git pull", git does a fetch then a merge.
  # If we've made changes locally and someone else has pushed changes
  # to our git host then git will automatically merge these together
  # and create a merge commit that looks like this in the history:
  #
  #    12345678 - Merge branch 'foo' of bar into master
  #
  # When we use "git pull --rebase", git does a fetch then a rebase.
  # A rebase resets the HEAD of your local branch to be the same as
  # the remote HEAD, then replays your local commits back into repo.
  # This means you don't get any noisy merge messages in your history.
  # This gives us a linear history, and also helps with git bisect.
  #
  # To automatically do "pull --rebase" for any branch based on master:
  #
  #    git config branch.master.rebase true
  #
  # To automatically do "pull --rebase" for all branches:
  #
  #     git config --global branch.autosetuprebase always
  #
  pr = pull --rebase

  ### rebase ###

  # rebase - forward-port local commits to the updated upstream head.
  rb = rebase

  # rebase - continue the rebasing process after resolving a conflict manually and updating the index with the resolution.
  rbc = rebase --continue

  # rebase - restart the rebasing process by skipping the current patch.
  rbs = rebase --skip

  # rbi - rebase interactive on our unpushed commits.
  #
  # Before we push our local changes, we may want to do some cleanup,
  # to improve our commit messages or squash related commits together.
  #
  # Let's say I've pushed two commits that are related to a new feature and
  # I have another where I made a spelling mistake in the commit message.
  # When I run "git rbi" I get dropped into my editor with this:
  #
  #     pick 7f06d36 foo
  #     pick ad544d0 goo
  #     pick de3083a hoo
  #
  # Let's say I want to squash the "foo" and "goo" commits together,
  # and also change "hoo" to say "whatever". To do these, I change "pick"
  # to say "s" for squash; this tells git to squash the two together;
  # I also edit "hoo". I make the file look like:
  #
  #     pick 7f06d36 foo
  #     s ad544d0 goo
  #     r de3083a whatever
  # This gives me two new commit messages to edit, which I update.
  # Now when I push the remote repo host receives two commits
  #
  #     3400455 - foo
  #     5dae0a0 - whatever
  #
  rbi = rebase --interactive @{upstream}

  # See https://blog.filippo.io/git-fixup-amending-an-older-commit/
  # This is a slightly modified version
  fixup = "!f() { TARGET=$(git rev-parse \"$1\"); git commit --fixup=$TARGET && GIT_EDITOR=true git rebase --interactive --autosquash $TARGET~; }; f"

  ### reflog ###

  # reflog - reference log that manages when tips of branches are updated.
  rl = reflog

  ### remote ###

  # remote - manage set of tracked repositories [same as "r"].
  rr = remote

  # remote show - gives some information about the remote <name>.
  rrs = remote show

  # remote update - fetch updates for a named set of remotes in the repository as defined by remotes.
  rru = remote update

  # remote prune - deletes all stale remote-tracking branches under <name>.
  rrp = remote prune

  incoming = !git remote update --prune; git log ..@{upstream}
  outgoing = log @{upstream}..

  # Push to all remotes
  push-to-all-remotes = !git remote | xargs -I% -n1 git push %

  ### revert ###

  # revert - undo the changes from some existing commits
  rv = revert

  # revert without autocommit; useful when you're reverting more than one commits' effect to your index in a row.
  rvnc = revert --no-commit

  ### show-branch ###

  # show-branch - print a list of branches and their commits.
  sb = show-branch

  ### submodule ###

  # submodule - enables foreign repositories to be embedded within a dedicated subdirectory of the source tree.
  sm = submodule

  # submodule update
  smu = submodule update

  # submodule update with initialize
  smui = submodule update --init

  # submodule update with initialize and recursive; this is useful to bring a submodule fully up to date.
  smuir = submodule update --init --recursive

  ### status ###

  # status with short format instead of full details
  ss = status --short

  # status with short format and showing branch and tracking info.
  ssb = status --short --branch

  ### ALIAS MANAGEMENT ###

  # Show our defined alias list
  aliases = "!git config --get-regexp '^alias\\.' | cut -c 7- | sed 's/ / = /'"

  add-alias = "!f() { [ $# = 3 ] && git config $1 alias.\"$2\" \"$3\" && return 0 || echo \"Usage: git add-(local|global)-alias <new alias> <original command>\" >&2 && return 1; }; f"
  add-global-alias = "!git add-alias --global"
  add-local-alias = "!git add-alias --local"

  # Rename an alias
  rename-alias = "!f() { [ $# = 3 ] && [ $2 != $3 ] && [ ! -z \"$(git config $1 --get alias.$2)\" ] && [ -z \"$(git config $1 --get alias.$3)\" ] && git config $1 alias.$3 \"$(git config $1 --get alias.$2)\" && git config $1 --unset alias.$2 && return 0 || echo \"Usage: git rename-(local|global)-alias <alias existing name> <new alias name>\nThe alias you are going to rename must exist and new name must not exist.\" >&2 && return 1; };f"
  rename-global-alias = "!git rename-alias --global"
  rename-local-alias = "!git rename-alias --local"

  # Last tag in the current branch
  lasttag = describe --tags --abbrev=0

  # Latest annotated tag in all branches
  lasttagged = !git describe --tags `git rev-list --tags --max-count=1`

  # Show our tags
  tags = tag -n1 --list

  # Diffs
  diff-all = !"for name in $(git diff --name-only $1); do git difftool $1 $name & done"
  diff-changes = diff --name-status -r
  diff-stat = diff --stat --ignore-space-change -r
  diff-staged = diff --cached

  # From https://gist.github.com/492227
  head = log -n1
  heads = !"git log origin/master.. --format='%Cred%h%Creset;%C(yellow)%an%Creset;%H;%Cblue%f%Creset' | git name-rev --stdin --always --name-only | column -t -s';'"
  lost = !"git fsck | awk '/dangling commit/ {print $3}' | git show --format='SHA1: %C(yellow)%h%Creset %f' --stdin | awk '/SHA1/ {sub(\"SHA1: \", \"\"); print}'"

  # Find text in any commit ever
  grep-all = !"f() { git rev-list --all | xargs git grep \"$@\"; }; f"

  # Given a merge commit, find the span of commits that exist(ed).
  # Not so useful in itself, but used by other aliases.
  # Thanks to Rob Miller for the merge-span-* aliaes.
  merge-span = !"f() { echo $(git log -1 $2 --merges --pretty=format:%P | cut -d' ' -f1)$1$(git log -1 $2 --merges --pretty=format:%P | cut -d' ' -f2); }; f"

  # Find the commits that were introduced by a merge
  merge-span-log = "!git log `git merge-span .. $1`"

  # Show the changes that were introduced by a merge
  merge-span-diff = !"git diff `git merge-span ... $1`"

  # Show the changes that were introduced by a merge, in your difftool
  merge-span-difftool = !"git difftool `git merge-span ... $1`"

  # Interactively rebase all the commits on the current branch
  rebase-branch = !"git rebase --interactive `git merge-base master HEAD`"

  # Sort by date for branches; can be useful for spring cleaning
  refs-by-date = for-each-ref --sort=-committerdate --format='%(committerdate:short) %(refname:short)'

  # Find all objects that aren't referenced by any other object (orphans).
  # To help an orphan, we create a new branch with the orphan's commit hash,
  # then merge it into our current branch:
  #
  #    git branch foo <commit>
  #    git merge foo
  #
  orphans = fsck --full

  # List all blobs by size in bytes.
  # By [CodeGnome](http://www.codegnome.com/)
  rev-list-all-objects-sort-by-size = !"git rev-list --all --objects  | awk '{print $1}'| git cat-file --batch-check | fgrep blob | sort -k3nr"


  ### LOG ALIASES ###

  # Show log of changes, most recent first
  log-changes = log --oneline --reverse

  # Show log of new commits after you fetched, with stats, excluding merges
  log-fresh = log ORIG_HEAD.. --stat --no-merges

  # Show log with dates in our local timezone
  log-local = log --date=local

  # Show the log for my own user email
  log-me = !git log --author $(git config user.email)

  # Show log as a graph
  log-graph = log --graph --all --oneline --decorate

  # Show the date of the first commit
  log-first-date = !"git log --date-order --date=iso --pretty=%ad --reverse | head -1"

  # Show the recent day
  log-day = log --since yesterday

  # Summarize your own changes since yesterday, suitable for a daily standup meeting.
  log-standup = !git log --since yesterday --author $(git config user.email) --pretty=short

  # TODO
  log-refs = log --all --graph --decorate --oneline --simplify-by-decoration --no-merges
  log-timeline = log --format='%h %an %ar - %s'
  log-local = log --oneline origin..HEAD
  log-fetched = log --oneline HEAD..origin/master

  # churn: show log of files that have many changes
  #
  #   * Written by (Corey Haines)[http://coreyhaines.com/]
  #   * Scriptified by Gary Bernhardt
  #   * Obtained from https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn
  #   * Edited for sixarm_git_config repo by Joel Parker Henderson
  #   * Comments by Mislav http://mislav.uniqpath.com/2014/02/hidden-documentation/
  #
  # Show churn for whole repo:
  #
  #   $ git churn
  #
  # Show churn for specific directories:
  #
  #   $ git churn app lib
  #
  # Show churn for a time range:
  #
  #   $ git churn --since='1 month ago'
  #
  # These are all standard arguments to `git log`.
  #
  # It's possible to get valuable insight from history of a project not only
  # by viewing individual commits, but by analyzing sets of changes as a whole.
  # For instance, git-log-churn compiles stats about which files change the most.
  #
  # For example, to see where work on an app was focused on in the past month:
  #
  #     $ git churn --since='1 month ago' app/ | tail
  #
  # This can also highlight potential problems with technical debt in a project.
  # A specific file changing too often is generally a red flag, since it probably
  # means the file either needed to be frequently fixed for bugs, or the file
  # holds too much responsibility and should be split into smaller units.
  #
  # Similar methods of history analysis can be employed to see which people were
  # responsible recently for development of a certain part of the codebase.
  #
  # For instance, to see who contributed most to the API part of an application:
  #
  #    $ git log --format='%an' --since='1 month ago' app/controllers/api/ | \
  #      sort | uniq -c | sort -rn | head
  #
  #    109 Alice Anderson
  #    13 Bob Brown
  #    7 Carol Clark
  #
  churn = !git log --all --find-copies --find-renames --name-only --format='format:' "$@" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print "count\tfile"} {print $1 "\t" $2}' | sort -g


  ### LOOKUP ALIASES ###

  # whois: given a string for an author, try to figure out full name and email:
  whois = "!sh -c 'git log --regexp-ignore-case -1 --pretty=\"format:%an <%ae>\n\" --author=\"$1\"' -"

  # Given any git object, try to show it briefly
  whatis = show --no-patch --pretty='tformat:%h (%s, %ad)' --date=short

  # Show who contributed with summarized changes
  who = shortlog --summary --

  # Show who contributed, in descending order by number of commits
  whorank = shortlog --summary --numbered --no-merges

  # List all issues mentioned in commit messages between range of commits
  #
  # Replace `\\\"ISSUE-[0-9]\\+\\\"` regular expression with one matching your issue tracking system.
  # For Jira it should be as simple as putting your project name in place of `ISSUE`.
  #
  # Best used with tags:
  #  $ git issues v1.0..v1.1
  #
  # But will work with any valid commit range:
  #  $ git issues master..HEAD

  issues = !sh -c \"git log $1 --oneline | grep -o \\\"ISSUE-[0-9]\\+\\\" | sort -u\"

  ### WORKFLOW ALIASES ###

  # Clone a git repository including all submodules
  cloner = clone --recursive

  # Stash aliases
  save = stash save
  pop = stash pop

  # Stash snapshot - from http://blog.apiaxle.com/post/handy-git-tips-to-stop-you-getting-fired/
  # Take a snapshot of your current working tree without removing changes.
  # This is handy for refactoring where you can't quite fit what you've done
  # into a commit but daren't stray too far from now without a backup.
  #
  # Running this:
  #
  #    $ git snapshot
  #
  # Creates this stash:
  #
  #    stash@{0}: On feature/handy-git-tricks: snapshot: Mon Apr 8 12:39:06 BST 2013
  #
  # And seemingly no changes to your working tree.
  #
  snapshot = !git stash save "snapshot: $(date)" && git stash apply "stash@{0}"

  # When you're a little worried that the world is coming to an end
  panic = !tar cvf ../git_panic.tar *

  # Do everything we can to synchronize all changes
  get = !git pull --rebase && git submodule update --init --recursive
  put = !git commit --all --message="$1" && git push

  # Ignore all untracked files by appending them to .gitignore:
  ignore = "!git status | grep -P \"^\\t\" | grep -vF .gitignore | sed \"s/^\\t//\" >> .gitignore"

  # Do a push/pull for just one branch
  push1 = "!git push origin $(git branch-name)"
  pull1 = "!git pull origin $(git branch-name)"


  ##
  # Reset & Undo
  ##

  # Reset and undo aliases are ways to move backwards on the commit chain.
  # We find that novices prefer the wording "undo"; experts prefer "reset".
  reset-commit       = reset --soft HEAD~1
  reset-commit-hard  = reset --hard HEAD~1
  reset-commit-clean = !git reset --hard HEAD~1 && git clean -fd
  reset-to-pristine   = !git reset --hard && git clean -ffdx
  reset-to-upstream  = !git reset --hard $(git upstream-name)

  # Undo is simply a synonym for "reset" because "undo" can help novices.
  undo-commit        = reset --soft HEAD~1
  undo-commit-hard   = reset --hard HEAD~1
  undo-commit-clean  = !git reset --hard HEAD~1 && git clean -fd
  undo-to-pristine   = !git reset --hard && git clean -ffdx
  undo-to-upstream   = !git reset --hard $(git upstream-name)

  # Nicknames
  uncommit = reset --soft HEAD~1
  unadd = reset HEAD
  unstage = reset HEAD

  # Discard changes in a (list of) file(s) in working tree
  discard = checkout --
  # Clean and discard changes and untracked files in working tree
  cleanout = !git clean -df && git checkout -- .

  # Edit all files of the given type
  edit-cached = !"f() { git ls-files --cached | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-deleted = !"f() { git ls-files --deleted | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-others = !"f() { git ls-files --others | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-ignored = !"f() { git ls-files --ignored | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-killed = !"f() { git ls-files --killed | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-modified = !"f() { git ls-files --modified | sort -u ; }; `git var GIT_EDITOR` `f`"
  edit-stage = !"f() { git ls-files --stage | cut -f2 | sort -u ; }; `git var GIT_EDITOR` `f`"

  # Editing and adding conflicted files: when we get many merge conflicts
  # and want to quickly solve them using an editor, then add the  files.
  edit-unmerged = !"f() { git ls-files --unmerged | cut -f2 | sort -u ; }; `git var GIT_EDITOR` `f`"
  add-unmerged = !"f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`"

  # Ours & Theirs - easy merging when you know which files you want
  #
  # Sometimes during a merge you want to take a file from one side wholesale.
  #
  # The following aliases expose the ours and theirs commands which let you
  # pick a file(s) from the current branch or the merged branch respectively.
  #
  #   * ours: checkout our version of a file and add it
  #   * theirs: checkout their version of a file and add it
  #
  # N.b. the function is there as hack to get $@ doing
  # what you would expect it to as a shell user.
  #
  ours   = !"f() { git checkout --ours $@ && git add $@; }; f"
  theirs = !"f() { git checkout --theirs $@ && git add $@; }; f"

  # Work In Progress: from https://gist.github.com/492227 and VonC on stackoverflow.
  # This enables a quick way to add all new and modified files to the index,
  # while cleaning the index from the files removed from the working tree;
  # this cleaning will facilite a rebase, because there won't be any conlfict
  # due to an "unclean" working directory (not in sync with the index).
  # The unwip will restore the deleted files to the working tree.
  wip = !"git add --all; git ls-files --deleted -z | xargs -0 git rm; git commit --message=wip"
  unwip = !"git log -n 1 | grep -q -c wip && git reset HEAD~1"

  # Assume
  #
  # Sometimes we want to change a file in a repo, but never check in your edits.
  # We can't use .gitignore because the file is tracked. We use update-index.
  #
  # If you interact with big corporate projects, such as projects in Subversion,
  # then you might run into the need to ignore certain files which are under
  # Subversion control, yet you need to modify them but not commit.
  # The assume-unchanged flag comes to the rescue.
  #
  # Suppose we want to edit passwords.txt and for god's sake never check it in:
  #
  #     $ git status
  #     modified passwords.txt
  #     modified foo.txt
  #
  #     $ git assume passwords.txt
  #     $ git status
  #     modified foo.txt
  #
  #     $ git assumed
  #     passwords.txt
  #
  #     $ git unassume passwords.txt
  #     $ git status
  #     modified passwords.txt
  #     modified foo.txt
  #
  # Thanks to http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/
  # Thanks to http://blog.apiaxle.com/post/handy-git-tips-to-stop-you-getting-fired/

  assume   = update-index --assume-unchanged
  unassume = update-index --no-assume-unchanged
  assume-all = "!git st -s | awk {'print $2'} | xargs git assume"
  unassume-all = "!git assumed | xargs git update-index --no-assume-unchanged"
  assumed  = !"git ls-files -v | grep ^h | cut -c 3-"

  # Delete all branches that have already been merged into the master branch.
  master-cleanse = !git master-cleanse-local; git master-cleanse-remote

  # Delete all local branches that have been merged into the local master branch.
  master-cleanse-local = "!git checkout master && git branch --merged | xargs git branch --delete"

  # Delete all remote branches that have been merged into the remote master branch.
  master-cleanse-remote = !"git branch --remotes --merged origin/master | sed 's# *origin/##' | grep -v '^master$' xargs -I% git push origin :% 2>&1 | grep --colour=never 'deleted'"

  # Publish the current branch by pushing it to the remote "origin",
  # and setting the current branch to track the upstream branch.
  publish = !"git push --set-upstream origin $(git branch-name)"

  # Unpublish the current branch by deleting the
  # remote version of the current branch.
  unpublish = !"git push origin :$(git branch-name)"

  # Delete a branch name, then create the same branch name based on master -
  # useful if you have, for example, a development branch and master branch
  # and they go out of sync, and you want to nuke the development branch.
  #
  # Calls the `publish` and `unpublish` aliases.
  #
  reincarnate = !"f() { [[ -n $@ ]] && git checkout \"$@\" && git unpublish && git checkout master && git branch -D \"$@\" && git checkout -b \"$@\" && git publish; }; f"

  # Friendly wording is easier to remember.
  # Thanks to http://gggritso.com/human-git-aliases
  branches = branch -a
  tags = tag
  stashes = stash list


  ### SHELL SCRIPTING ALIASES ###

  # Get the current branch name
  branch-name = rev-parse --abbrev-ref HEAD

  # Get name of the upstream branch
  upstream-name = !git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)

  # Get the top level directory, regardless of what subdirectory we're in.
  # root = ! pwd # this one is funny but slow
  root = rev-parse --show-toplevel

  # Execute shell scripts. Git always runs scripts in the top directory.
  # For example "git exec pwd" will always show you the top directory.
  exec = ! exec


  ### MAINTENANCE ALIASES ###

  # pruner: prune everything that is unreachable now.
  #
  # This command takes a long time to run, perhaps even overnight.
  #
  # This is useful for removing unreachable objects from all places.
  #
  # By [CodeGnome](http://www.codegnome.com/)
  #
  pruner = !"git prune --expire=now; git reflog expire --expire-unreachable=now --rewrite --all"

  # repacker: repack a repo the way Linus recommends.
  #
  # This command takes a long time to run, perhaps even overnight.
  #
  # It does the equivalent of "git gc --aggressive"
  # but done *properly*,  which is to do something like:
  #
  #     git repack -a -d --depth=250 --window=250
  #
  # The depth setting is about how deep the delta chains can be;
  # make them longer for old history - it's worth the space overhead.
  #
  # The window setting is about how big an object window we want
  # each delta candidate to scan.
  #
  # And here, you might well want to add the "-f" flag (which is
  # the "drop all old deltas", since you now are actually trying
  # to make sure that this one actually finds good candidates.
  #
  # And then it's going to take forever and a day (ie a "do it overnight"
  # thing). But the end result is that everybody downstream from that
  # repository will get much better packs, without having to spend any effort
  # on it themselves.
  #
  # http://metalinguist.wordpress.com/2007/12/06/the-woes-of-git-gc-aggressive-and-how-git-deltas-work/
  #
  # We also add the --window-memory limit of 1 gig, which helps protect
  # us from a window that has very large objects such as binary blobs.
  #
  repacker = repack -a -d -f --depth=300 --window=300 --window-memory=1g

  # Do everything we can to optimize the repository.
  #
  # This command takes a long time to run, perhaps even overnight.
  #
  # Currently, this command simply calls `git pruner` and `git repacker`.
  # There's a step that may be unnecessarying, calling `git prune-pack`.
  #
  optimize = !git pruner; git repacker; git prune-packed


  ### ADVANCED ALIASES ###

  # Search for a given string in all patches and print commit messages.
  # Posted by Mikko Rantalainen on StackOverflow.
  #
  # Example: search for any commit that adds or removes string "foobar"
  #     git searchcommits foobar
  #
  # Example: search commits for string "foobar" in directory src/lib
  #     git searchcommits foobar src/lib
  #
  # Example: search commits for "foobar", print full diff of commit with 1 line context
  #     git searchcommits foobar --pickaxe-all -U1 src/lib
  searchcommits = !"f() { query=\"$1\"; shift; git log -S\"$query\" \"$@\"; }; f \"$@\""

  # A 'debug' alias to help debugging builtins: when debugging builtins,
  # we use gdb to analyze the runtime state. However, we have to disable
  # the pager, and often we have to call the program with arguments.
  # If the program to debug is a builtin, we use this alias.
  debug = !GIT_PAGER= gdb --args git

  # Getting the diff of only one function: when we want to see just the
  # differences of one function in one file in two different commits,
  # we create two temp files which contain only the function, then diff.
  # Use this alias this way: git funcdiff <old-rev> <new-rev> <path> <function>
  # diff-func = !sh -c "git show \"\$1:\$3\" | sed -n \"/^[^ \t].*\$4(/,/^}/p\" > .tmp1 && git show \"\$2:\$3\" | sed -n \"/^[^ \t].*\$4(/,/^}/p\" > .tmp2 && git diff --no-index .tmp1 .tmp2" -

  # Calling "interdiff" between commits: if upstream applied a
  # slightly modified patch, and we want to see the modifications,
  # we use the program interdiff of the patchutils package.
  intercommit = !sh -c 'git show "$1" > .git/commit1 && git show "$2" > .git/commit2 && interdiff .git/commit[12] | less -FRS' -

  # Prune all your stale remote branches: there's no way to tell
  # git remote update to prune stale branches, and git remote prune
  # does not understand --all. So here is a shell command to do it.
  prune-all = !git remote | xargs -n 1 git remote prune

  # Thanks to cody cutrer
  cherry-pick-merge = !"sh -c 'git cherry-pick --no-commit --mainline 1 $0 && \
    git log -1 --pretty=%P $0 | cut -b 42- > .git/MERGE_HEAD && \
    git commit --verbose'"

  # Thanks to jtolds on stackoverflow
  remote-ref = !"sh -c ' \
    local_ref=$(git symbolic-ref HEAD); \
    local_name=${local_ref##refs/heads/}; \
    remote=$(git config branch.\"#local_name\".remote || echo origin); \
    remote_ref=$(git config branch.\"$local_name\".merge); \
    remote_name=${remote_ref##refs/heads/}; \
    echo remotes/$remote/$remote_name'"

  # Thanks to jtolds on stackoverflow
  rebase-recent = !git rebase --interactive $(git remote-ref)

  # Use graphviz for display.
  # This produces output that can be displayed using dotty, for example:
  #   $ git graphviz HEAD~100..HEAD~60 | dotty /dev/stdin
  #   $ git graphviz --first-parent master | dotty /dev/stdin
  graphviz = !"f() { echo 'digraph git {' ; git log --pretty='format:  %h -> { %p }' \"$@\" | sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; echo '}'; }; f"

  # Serve the local directory by starting a git server daemon, so others can pull/push from my machine
  serve = "-c daemon.receivepack=true daemon --base-path=. --export-all --reuseaddr --verbose"

  ##########################################################################

  ##
  # Git aliases suitable for particular software integrations and tooling,
  # such as other version control system e.g. CVS, Subversion, etc.
  ##

  ### CVS ALIAS ###

  cvs-i = cvsimport -k -a
  cvs-e = cvsexportcommit -u -p

  ### GitK ###

  # show conflicting merge in gitk:
  gitk-conflict = !gitk --left-right HEAD...MERGE_HEAD

  # show full history in gitk (including "deleted" branches and stashes)
  gitk-history-all = !gitk --all $( git fsck | awk '/dangling commit/ {print $3}' )

  ### Ruby on Rails ###

  # Do everything we can to synchronize all changes for a Ruby On Rails app.
  # We like using rebase (instead of merge), bundle for gems, and rake db:migrate
  rails-get = !"git pull --rebase; git submodule update --init --recursive; bundle check || bundle install; bundle exec rake db:migrate; bundle exec rake db:test:prepare"

  ### Subversion ###

  svn-b = svn branch
  svn-m = merge --squash
  svn-c = svn dcommit
  svn-cp = !GIT_EDITOR='sed -i /^git-svn-id:/d' git cherry-pick --edit

  ##########################################################################

  ##
  # Git aliases to correct common typing mistakes, which git built-in autocorrection
  # does not handle
  ##

  ### Use with shell alias `gitp = git` ###

  ull = pull
  ush = push

# added by SGK 2024-12-29
  dirdiff = difftool --ignore-submodules --dir-diff --no-symlinks --tool=vimdirdiff
  dd = dirdiff
	ll = log --graph --all --decorate -30 --topo-order --date=format-local:'%Y-%m-%d %H:%M (%a)' --pretty=format:'%Cgreen%ad%Creset %C(auto)%h%d %s %C(bold black)<%aN>%Creset'
  l3 = ll -n 3
  l10 = ll -n 10
  l30 = ll -n 30

