if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/rle44/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto

# Plugins {{{
# ==============================================================================
    export NVM_LAZY=1
    plugins=(
        zsh-autocomplete
        nvm
        git
        colored-man-pages
        zsh-autosuggestions
        fzf
    )

    source $ZSH/oh-my-zsh.sh
# }}}

# Configuration {{{
# ==============================================================================
oh

    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:$PATH

    export DEFAULT_USER="$USER"

    # Vim mode
    bindkey -v
    export KEYTIMEOUT=1

    export GIT_EDITOR=nvim
    export EDITOR='nvim'

    zstyle ':autocomplete:*' min-delay 0.3
    zstyle ':completion:*:*:man:*:*' menu select=long search

# }}}

# Aliases & Functions {{{
# ==============================================================================


    # General
    alias vim="nvim"
    alias v="nvim"
    alias vim="nvim"
    alias cl="clear"
    alias stat="stat -x"
    alias grep="rg"
    alias cat="bat"

    # fzf settings
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_BASE="$HOME/.fzf"
    export FZF_TMUX=1
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
    # Using ripgrep instead of default find
    export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
    # CTRL-T's command
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # ALT-C's command
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
    bindkey "ç" fzf-cd-widget

    # fzf git checkout functions yahooo
    is-in-git-repo() {
        git rev-parse HEAD > /dev/null 2>&1
    }

    fzf-down() {
        fzf-tmux --height 50% --min-height 20 --ansi --border --bind ctrl-/:toggle-preview "$@"
    }

    fzf-git-branch() {
        git branch --color=always --all --sort=-committerdate |
            grep -v HEAD |
            fzf-down --no-multi --reverse --preview-window right:65% \
                --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
            sed "s/.* //"
    }

    fzf-git-checkout() {
        is-in-git-repo || return

        local branch

        branch=$(fzf-git-branch)
        if [[ "$branch" = "" ]]; then
            echo "No branch selected."
            return
        fi

        if [[ "$branch" = 'remotes/'* ]]; then
            git checkout --track $branch
        else
            git checkout $branch;
        fi
    }

    fzf-git-commit-hash() {
        git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
        fzf-down --no-sort --reverse --multi \
        --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -1 | xargs git show --color=always | head -'$LINES |
        rg -o "[a-f0-9]\{7,\}" | head -1
    }

    fzf-git-checkout-commit-hash() {
        is-in-git-repo || return
        local commitHash
        commitHash=$(fzf-git-commit-hash)
        git checkout $commitHash
    }

    alias gch='fzf-git-checkout-commit-hash'
    alias gco='fzf-git-checkout'

# }}}

# Interactive shell startup scripts {{{
# ==============================================================================

    # if [[ $- == *i* && $0 == '/bin/zsh' ]]; then
    #     ~/.dotfiles/scripts/login.sh
    # fi

# }}}

# vim: set nospell foldmethod=marker foldlevel=0:

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Must source at very end of file
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh