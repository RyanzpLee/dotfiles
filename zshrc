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
        git
        colored-man-pages
        zsh-autosuggestions
        fzf
        zoxide
        autoupdate
        zsh-autocomplete
        nvm
        # Source this last
        zsh-syntax-highlighting
    )

    source $ZSH/oh-my-zsh.sh
# }}}

# Configuration {{{
# ==============================================================================


    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    export DEFAULT_USER="$USER"

    # Vim mode
    bindkey -v
    export KEYTIMEOUT=1

    zstyle ':omz:plugins:nvm' lazy true
    zstyle ':autocomplete:*' min-delay 0.3
    zstyle ':completion:*:*:man:*:*' menu select=long search
    zstyle ':autocomplete:*' min-input 2
# }}}

# Aliases & Functions {{{
# ==============================================================================


    # General
    alias v=nvim
    # use neovim as vim
    if [ -x "$(command -v nvim)" ]; then
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
    bindkey "^E" autosuggest-accept
    
    bindkey -s ^f "tmux-sessionizer\n"
# }}}


# source junegunns fzf git helpers
source ~/dotfiles/fzf-git.sh

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/usr/local/go/bin
export PATH="/opt/homebrew/bin/python3:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
