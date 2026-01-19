# Dotfiles

My personal configuration files for macOS.

## What's Included

- **`.zshrc`** - Zsh shell configuration with Starship prompt
- **`.secrets.template`** - Template for environment variables (copy to `~/.secrets`)

## Features

- 🚀 [Starship](https://starship.rs/) - Fast, customizable terminal prompt
- 🔐 Secure secrets management (not committed to git)
- 🎨 Optimized for Catppuccin Mocha theme

## Custom Functions

### `gwt` - Git Worktree Helper
Creates a git worktree and copies gitignored config files from the main worktree:
- `.env`
- `.claude/settings.local.json`

```bash
gwt .worktrees/my-feature feature/my-feature
```

## Fresh Setup on a New Machine

### 1. Clone this repo
```bash
git clone https://github.com/Collint25/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install dependencies
```bash
# Starship prompt
brew install starship

# Nerd Font for icons
brew install --cask font-meslo-lg-nerd-font

# GitHub CLI
brew install gh
gh auth login
```

### 3. Create symlinks
```bash
# Backup existing config if needed
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup

# Create symlink
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

### 4. Set up secrets
```bash
# Copy template and fill in your tokens
cp ~/dotfiles/.secrets.template ~/.secrets
chmod 600 ~/.secrets

# Edit with your actual tokens
nano ~/.secrets
```

### 5. Configure VS Code terminal font
Add to VS Code settings:
```json
{
  "terminal.integrated.fontFamily": "MesloLGS Nerd Font",
  "terminal.integrated.fontSize": 14
}
```

### 6. Reload shell
```bash
source ~/.zshrc
```

## File Structure

```
~/dotfiles/
├── .zshrc              # Shell configuration (synced)
├── .secrets.template   # Template for secrets (synced)
├── .gitignore          # Excludes .secrets from git
└── README.md           # This file
```

## Security Note

- Actual secrets live in `~/.secrets` (NOT synced)
- GitHub CLI stores credentials in system keychain
- Each machine has its own secrets file

## Customization

### Starship Prompt
Customize your prompt:
```bash
# Create config file
mkdir -p ~/.config
starship preset tokyo-night -o ~/.config/starship.toml

# Or browse presets
starship preset --help
```

## License

MIT - Feel free to use and modify!
