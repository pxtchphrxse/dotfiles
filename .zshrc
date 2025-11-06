# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::git
zinit snippet OMZP::tmux
zinit snippet OMZP::yarn
zinit snippet OMZP::npm
zinit light ntnyq/omz-plugin-pnpm
zinit snippet OMZP::docker
zinit light ntnyq/omz-plugin-bun

autoload -Uz _zinit

# load secret & env if exists
[ -r ~/.secret.zsh ] && source ~/.secret.zsh

# aliases
source ~/.aliases.zsh

# custom word separators
export WORDCHARS="?_-~=&;!#$%^"
# key bindings
bindkey -v
bindkey -M viins "^A" beginning-of-line
bindkey -M vicmd "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M vicmd "^E" end-of-line
bindkey -M viins "^W" backward-kill-word
bindkey -M vicmd "^W" backward-kill-word
bindkey -M viins "^[b" backward-word
bindkey -M vicmd "^[b" backward-word
bindkey -M viins "^[f" forward-word
bindkey -M vicmd "^[f" forward-word
# make backspace work in not inserted vi insert mode
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
# prevent closing session when typing Ctrl+D (EOF)
bindkey -s '^d' ''

export EDITOR=nvim
export VISUAL=nvim

# fvm (fast nvm alternative)
eval "$(fnm env --use-on-cd --shell zsh)"
# fvm end

# history options
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify

# auto suggestions & syntax highlighting
zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# powerlevel10k end

# zoxide (better cd)
alias cd="z"
eval "$(zoxide init zsh)"

# bat (better cat)
export BAT_THEME=OneHalfDark

# fzf
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
eval "$(fzf --zsh)"
bindkey -r '^T'
bindkey '^F' fzf-file-widget
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
zinit ice src="fzf-git.sh"; zinit light junegunn/fzf-git.sh
zinit ice src="fzf-tab.zsh"; zinit light Aloxaf/fzf-tab
# fzf end

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

 # eval "$(/usr/libexec/path_helper)"

# bun completions
[ -s "/Users/pxtchphrxse/.bun/_bun" ] && source "/Users/pxtchphrxse/.bun/_bun"
