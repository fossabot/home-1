source "$HOME/script/profile"

function adjust_ps1 {
  perl -pe 's{(\\\$)([^\$]+?)$}{ $1 $2}s'
}

function render_ps1 {
  echo
  powerline-go -error $? --colorize-hostname -cwd-mode plain -mode flat -newline -numeric-exit-codes \
    -priority root,cwd,user,host,ssh,perms,git-branch,jobs,exit,cwd-path,git-status \
    -modules user,host,ssh,cwd,perms,gitlite,jobs,exit${TMUX_PANE:+,shell-var --shell-var TMUX_PANE}
}

function update_ps1 {
  PS1="$(render_ps1 | adjust_ps1)"
}

PROMPT_COMMAND="update_ps1"
