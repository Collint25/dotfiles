# Source secrets (not synced to dotfiles repo)
[ -f ~/.secrets ] && source ~/.secrets

# Initialize Starship prompt
eval "$(starship init zsh)"