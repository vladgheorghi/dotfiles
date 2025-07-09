# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# FZF Keybindings and Completions
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt extendedglob nomatch notify
unsetopt autocd beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vlad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zinit path (if XDG does not exist, defaults to ~/.local/share
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# creates the directory and clones the repo if not already exists
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" 
fi

# source zinit
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# add powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# More zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# keybindings
# search forward and backward in command history (CTRL+P/CTRL+N)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# move by word using CTRL+Arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# delete left/right word using CTRL+Backspace/Delete
bindkey '^H' backward-kill-word
bindkey "^[[3;5~" kill-word
# delete forward chars with Delete
bindkey "^[[3~" delete-char

# completion styling
# completion becomes non-case sensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# colors files and directories for autocompletion (like ls --color)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# disable the default zshell fuzzy completion menu
zstyle ':completion:*' menu no

# aliases
# ls colors directories
alias ls='ls --color'

# if VS Code is blurry enable HiDPI scale
alias code='ELECTRON_ENABLE_HIGH_DPI_SCALE_FACTOR_OVERRIDE=1 code'

# shell integrations

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
