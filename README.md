# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for macOS and Ubuntu.

## What's Included

- **Shell configuration**: zsh configuration with modular setup (core, aliases, productivity enhancements)
- **Tool configurations**:
  - `atuin` - shell history sync
  - `duf` - better df alternative
  - `fish` - fish shell configuration
  - `htop` - interactive process viewer
  - `lsd` - modern ls replacement
  - `nvim` - Neovim configuration
  - `ripgrep` - fast grep alternative

## Initial Setup on a New Machine

### 1. Install chezmoi

**macOS:**
```bash
brew install chezmoi
```

**Ubuntu:**
```bash
sudo snap install chezmoi --classic
# or
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Initialize with this repository

Replace `YOUR_GITHUB_USERNAME` with your actual GitHub username:

```bash
chezmoi init https://github.com/YOUR_GITHUB_USERNAME/dotfiles.git
```

Or if you've already cloned this repo locally:

```bash
chezmoi init /path/to/dotfiles
```

### 3. Preview what changes would be made

```bash
chezmoi diff
```

### 4. Apply the dotfiles

```bash
chezmoi apply
```

Or combine steps 3 and 4:

```bash
chezmoi apply -v
```

## Daily Usage

### Update dotfiles from repository

```bash
chezmoi update
```

### Add a new dotfile to chezmoi

```bash
chezmoi add ~/.newconfig
```

### Edit a dotfile

```bash
chezmoi edit ~/.zshrc
```

This opens the file in your editor. After saving, apply changes:

```bash
chezmoi apply ~/.zshrc
```

### Check what would change

```bash
chezmoi diff
```

### Commit and push changes

```bash
chezmoi cd
git add .
git commit -m "Update configuration"
git push
exit
```

## File Structure

Chezmoi uses a special naming convention:

- `dot_zshrc` → `~/.zshrc`
- `dot_config/nvim/init.lua` → `~/.config/nvim/init.lua`
- `dot_zsh_history` → `~/.zsh_history` (ignored, won't sync)

Files listed in `.chezmoiignore` won't be applied to your home directory (e.g., shell history, README).

## Platform-Specific Configurations

If you need different configs for macOS vs Ubuntu, you can use chezmoi templates:

```bash
# Create platform-specific file
chezmoi add --template ~/.someconfig
```

Then edit with conditional logic:
```
{{- if eq .chezmoi.os "darwin" }}
# macOS specific config
{{- else if eq .chezmoi.os "linux" }}
# Linux specific config
{{- end }}
```

## Troubleshooting

### Check chezmoi status
```bash
chezmoi status
```

### See what chezmoi is managing
```bash
chezmoi managed
```

### Verify configuration
```bash
chezmoi verify
```

### Re-apply everything
```bash
chezmoi apply --force
```

## More Information

- [Chezmoi documentation](https://www.chezmoi.io/)
- [Chezmoi quick start](https://www.chezmoi.io/quick-start/)
