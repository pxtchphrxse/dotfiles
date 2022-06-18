set fish_greeting ""

# PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH node_modules/.bin $PATH
# set -gx PATH ~/.yarn/bin $PATH

# aliases
alias aliases "alias | peco"
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias lld "ll -D"
alias llda "lla -D"
alias vim nvim
alias vim. "vim ."
alias v vim
git_aliases
yarn_aliases
tmux_aliases
alias code "code-insiders"

set -gx EDTIOR nvim

# NVM
load_nvm
