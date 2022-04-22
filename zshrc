if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':omz:update' mode auto

# Plugins {{{
# ==============================================================================
    plugins=(
        nvm
        git
        pip
        colored-man-pages
        zsh-autosuggestions
        fzf
        zoxide
        autoupdate
        zsh-autocomplete
    )

    source $ZSH/oh-my-zsh.sh
# }}}

# Configuration {{{
# ==============================================================================


    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    export DEFAULT_USER="$USER"

    export NVM_LAZY=1

    # Vim mode
    bindkey -v
    export KEYTIMEOUT=1

    zstyle ':autocomplete:*' min-delay 0.3
    zstyle ':completion:*:*:man:*:*' menu select=long search
    zstyle ':autocomplete:*' min-input 2
# }}}

# Aliases & Functions {{{
# ==============================================================================


    # General
    alias vi=vim
    alias v=vim
    # use neovim as vim
    if [ -x "$(command -v nvim)" ]; then
      alias vim=nvim
      alias ovim=vim # to use vim type ovim
      export EDITOR=nvim
      export GIT_EDITOR=nvim
    fi

    alias cl="clear"
    alias lg="lazygit"
    alias stat="stat -x"
    alias sc="source ~/.zshrc"
    alias ec="v ~/.zshrc"

    export BAT_THEME="gruvbox-dark"
    # fzf settings
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_BASE="$HOME/.fzf"
    export FZF_TMUX=1
    FZF_COMMON_OPTIONS="
    --bind=',:toggle-preview'
    --preview '([[ -d {} ]] && tree -C {}) || ([[ -f {} ]] && bat --style=full --color=always {}) || echo {}'"

    command -v bat > /dev/null && command -v tree > /dev/null && export FZF_DEFAULT_OPTS="$FZF_COMMON_OPTIONS"
    command -v rg > /dev/null && export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
    command -v fd > /dev/null && export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
    command -v fd > /dev/null && export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    bindkey "ç" fzf-cd-widget

    bindkey -s ^f "tmux-sessionizer\n"
# }}}

# fzf git integration from https://junegunn.kr/2016/07/fzf-git/
# CTRL-G CTRL-F for files
# CTRL-G CTRL-B for branches
# CTRL-G CTRL-T for tags
# CTRL-G CTRL-R for remotes
# CTRL-G CTRL-G for commit hashes
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf-tmux --height 50% --min-height 20 --ansi --border --bind ctrl-/:toggle-preview "$@"
}

fzf-gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

fzf-gb() {
  is_in_git_repo || return
  git branch --sort committerdate -a --color=always | grep -v '/HEAD\s' |
  fzf-down --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/origin/##'
}

fzf-gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# for commit hashes
fzf-gg() {
  is_in_git_repo || return
  git log --reflog --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

fzf-gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzf-g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}

bind-git-helper f b t r g
unset -f bind-git-helper

# vim: set nospell foldmethod=marker foldlevel=0:

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/usr/local/go/bin
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

# Must source at very end of file
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
