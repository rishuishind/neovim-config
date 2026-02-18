# Font Ligatures Setup Guide ✨

Font ligatures make code symbols look prettier by combining characters:
- `!=` → `≠`
- `==` → `═`
- `=>` → `⇒`
- `>=` → `≥`
- `<=` → `≤`
- `->` → `→`
- `&&` → `∧`
- `||` → `∨`

## What You Need

This is a **font feature**, not a Neovim setting. You need:
1. A font with programming ligatures
2. Enable ligatures in your terminal

## Recommended Fonts (Free)

### 1. **Fira Code** (Most Popular)
- Download: https://github.com/tonsky/FiraCode
- Best for: General programming
- Ligatures: Extensive

### 2. **JetBrains Mono**
- Download: https://www.jetbrains.com/lp/mono/
- Best for: Clean, modern look
- Ligatures: Moderate

### 3. **Cascadia Code**
- Download: https://github.com/microsoft/cascadia-code
- Best for: Windows users
- Ligatures: Good

### 4. **Iosevka**
- Download: https://github.com/be5invis/Iosevka
- Best for: Narrow, space-efficient
- Ligatures: Extensive

### 5. **Victor Mono**
- Download: https://rubjo.github.io/victor-mono/
- Best for: Cursive italics
- Ligatures: Good

## Installation Steps

### On Linux (Ubuntu/Debian)

#### Option 1: Fira Code (Recommended)
```bash
# Install via package manager
sudo apt install fonts-firacode

# Or download manually
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
fc-cache -f -v
```

#### Option 2: JetBrains Mono
```bash
# Download and install
cd /tmp
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip -d JetBrainsMono
mkdir -p ~/.local/share/fonts
cp JetBrainsMono/fonts/ttf/*.ttf ~/.local/share/fonts/
fc-cache -f -v
```

### Verify Installation
```bash
fc-list | grep -i "fira code"
# or
fc-list | grep -i "jetbrains"
```

## Configure Your Terminal

### For GNOME Terminal
1. Open Terminal
2. Preferences → Profile → Text
3. Enable "Custom font"
4. Select "Fira Code" or "JetBrains Mono"
5. Restart terminal

### For Alacritty
Edit `~/.config/alacritty/alacritty.yml`:
```yaml
font:
  normal:
    family: "Fira Code"
    style: Regular
  size: 12.0
```

### For Kitty
Edit `~/.config/kitty/kitty.conf`:
```conf
font_family      Fira Code
font_size        12.0
```

### For WezTerm
Edit `~/.config/wezterm/wezterm.lua`:
```lua
return {
  font = wezterm.font("Fira Code"),
  font_size = 12.0,
}
```

### For Terminator
1. Right-click → Preferences
2. Profiles → General
3. Uncheck "Use system fixed width font"
4. Click "Choose A Font"
5. Select "Fira Code" or "JetBrains Mono"

### For tmux
Ligatures work automatically if your terminal supports them.

## Enable Ligatures in Neovim

Once you have the font installed and configured in your terminal, you may need to enable ligatures in Neovim:

Add to your `init.lua`:
```lua
-- Enable font ligatures (if your terminal supports it)
vim.g.gui_font_default_size = 12
vim.g.gui_font_size = 12
vim.g.gui_font_face = "Fira Code"
```

**Note:** This mainly applies to GUI versions of Neovim (like Neovide, Neovim-Qt). For terminal Neovim, the terminal handles ligatures.

## Testing Ligatures

Create a test file and see if these render as ligatures:

```javascript
// Test ligatures
if (x != y) {
  return x >= y && x <= z;
}

const arrow = () => {
  return x === y || x !== z;
};

// More ligatures
x -> y
x => y
x == y
x === y
x != y
x !== y
x >= y
x <= y
x && y
x || y
```

## Troubleshooting

### Ligatures not showing?

1. **Check font is installed:**
   ```bash
   fc-list | grep -i "fira"
   ```

2. **Verify terminal is using the font:**
   - Check terminal preferences
   - Restart terminal after changing font

3. **Some terminals don't support ligatures:**
   - GNOME Terminal: ✅ Supports
   - Alacritty: ✅ Supports
   - Kitty: ✅ Supports
   - WezTerm: ✅ Supports
   - xterm: ❌ No support
   - Basic Linux terminal: ❌ Limited support

4. **Try a different terminal:**
   ```bash
   # Install Alacritty (great ligature support)
   sudo apt install alacritty
   ```

### Ligatures look weird?

Try adjusting font size in your terminal. Ligatures work best at sizes 11-14.

### Want to disable specific ligatures?

Some fonts (like Fira Code) allow customization. Check the font's documentation.

## Neovim GUI Alternatives (Better Ligature Support)

If you want perfect ligature rendering:

### 1. **Neovide** (Recommended)
```bash
# Install Neovide
cargo install neovide
# or
sudo snap install neovide
```

Run with:
```bash
neovide
```

### 2. **Neovim-Qt**
```bash
sudo apt install neovim-qt
```

### 3. **VimR** (macOS only)
Download from: https://github.com/qvacua/vimr

## My Recommendation

For the best experience:
1. **Install Fira Code** (most popular, great ligatures)
2. **Use Alacritty or Kitty terminal** (best ligature support)
3. **Set font size to 12-13** (optimal for ligatures)

## Quick Setup (Copy-Paste)

```bash
# Install Fira Code
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
fc-cache -f -v

# Install Alacritty (if not installed)
sudo apt install alacritty

# Configure Alacritty
mkdir -p ~/.config/alacritty
cat > ~/.config/alacritty/alacritty.yml << 'EOF'
font:
  normal:
    family: "Fira Code"
    style: Regular
  size: 12.0
EOF

# Launch Alacritty
alacritty
```

Then open Neovim in Alacritty and enjoy ligatures! ✨

## Enable Nerd Font Icons Too

While you're at it, enable Nerd Font support in Neovim for better icons:

In your `init.lua`, change:
```lua
vim.g.have_nerd_font = true
```

Then install a Nerd Font version:
```bash
# Fira Code Nerd Font
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip
fc-cache -f -v
```

Now you'll have both ligatures AND icons! 🎉
