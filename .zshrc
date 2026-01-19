# Source secrets (not synced to dotfiles repo)
[ -f ~/.secrets ] && source ~/.secrets

# Initialize Starship prompt
eval "$(starship init zsh)"

# Git worktree helper - copies gitignored config files from main worktree
gwt() {
  if [[ $# -lt 1 ]]; then
    echo "Usage: gwt <path> [<branch>]"
    echo "Creates a git worktree and copies .env, .claude/settings.local.json from main"
    return 1
  fi

  # Create the worktree
  git worktree add "$@" || return 1

  # Find main worktree (first one listed is usually main)
  local main_worktree
  main_worktree=$(git worktree list --porcelain | grep "^worktree " | head -1 | cut -d' ' -f2)

  # Copy .env if it exists in main
  if [[ -f "$main_worktree/.env" ]]; then
    cp "$main_worktree/.env" "$1/.env"
    echo "Copied .env"
  fi

  # Copy .claude/settings.local.json if it exists in main
  if [[ -f "$main_worktree/.claude/settings.local.json" ]]; then
    mkdir -p "$1/.claude"
    cp "$main_worktree/.claude/settings.local.json" "$1/.claude/settings.local.json"
    echo "Copied .claude/settings.local.json"
  fi
}