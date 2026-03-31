# Keymaps Guide 🎹

Understanding how keymaps work in your Neovim config.

## How the Popup Menu Works

The popup you see when pressing `<leader>` (Space) is from the **which-key** plugin.

## Two Ways to Define Keymaps

### 1. Individual Keymaps (Most Common)

Add anywhere in `init.lua`:

```lua
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', { desc = 'Open file [E]xplorer' })
```

**Breakdown:**
- `'n'` - Normal mode
- `'<leader>e'` - Space + e
- `'<cmd>Ex<cr>'` - Command to run
- `{ desc = '...' }` - Description shown in which-key popup

**Other modes:**
- `'n'` - Normal mode
- `'i'` - Insert mode
- `'v'` - Visual mode
- `'x'` - Visual block mode
- `''` - All modes

### 2. Group Names (in which-key config)

In the which-key section (around line 370):

```lua
spec = {
  { '<leader>s', group = '[S]earch' },
  { '<leader>t', group = '[T]oggle' },
  { '<leader>b', group = '[B]uffer' },
},
```

This creates **category headers** in the popup menu.

## Current Keymaps

### File Operations
- `<leader>e` - Open file explorer
- `<leader>sf` - Search files
- `<leader>s.` - Recent files

### Buffer Operations
- `<leader>bd` - Delete buffer
- `<leader>bp` - Pick buffer
- `<leader>bc` - Pick buffer to close
- `<leader><leader>` - Find buffers
- `Tab` - Next buffer
- `Shift+Tab` - Previous buffer

### Search Operations
- `<leader>sh` - Search help
- `<leader>sk` - Search keymaps
- `<leader>sw` - Search word
- `<leader>sg` - Search by grep
- `<leader>sd` - Search diagnostics
- `<leader>sr` - Search resume
- `<leader>/` - Search in current buffer

### Formatting
- `<leader>f` - Format buffer or selection

### LSP Operations
- `grn` - Rename
- `gra` - Code action
- `grr` - References
- `gri` - Implementation
- `grd` - Definition
- `grD` - Declaration
- `grt` - Type definition
- `K` - Hover documentation

### Folding
- `za` - Toggle fold
- `zc` - Close fold
- `zo` - Open fold
- `zM` - Close all folds
- `zR` - Open all folds

## Adding Your Own Keymaps

### Example 1: Simple Command

```lua
-- Add after line 207 in init.lua (after the file explorer keymap)
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite (save) file' })
```

### Example 2: Function Call

```lua
vim.keymap.set('n', '<leader>x', function()
  vim.cmd('!chmod +x %')
  print('Made file executable')
end, { desc = 'Make file e[X]ecutable' })
```

### Example 3: Visual Mode Keymap

```lua
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to clipboard' })
```

### Example 4: Multiple Modes

```lua
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { desc = '[D]elete to black hole' })
```

## Adding a New Group

1. **Add the group** in which-key config (around line 370):

```lua
spec = {
  { '<leader>s', group = '[S]earch' },
  { '<leader>t', group = '[T]oggle' },
  { '<leader>b', group = '[B]uffer' },
  { '<leader>g', group = '[G]it' },  -- New group!
},
```

2. **Add keymaps** that use that prefix:

```lua
vim.keymap.set('n', '<leader>gs', '<cmd>Git status<cr>', { desc = 'Git [S]tatus' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git [P]ush' })
```

Now pressing `<leader>g` shows:
```
[G]it
  s → Git Status
  c → Git Commit
  p → Git Push
```

## Where to Add Keymaps

### Option 1: In init.lua
Add after line 207 (after the file explorer keymap):

```lua
-- File explorer shortcut
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', { desc = 'Open file [E]xplorer' })

-- YOUR CUSTOM KEYMAPS HERE
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite file' })
```

### Option 2: In a separate file
Create `lua/custom/keymaps.lua`:

```lua
-- Custom keymaps
local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite file' })
map('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit' })
map('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save and [X]it' })

return {}
```

This file will be loaded automatically since we have `{ import = 'custom.plugins' }` enabled.

## Tips

### 1. Use Descriptive Names
```lua
-- Good
{ desc = 'Open file [E]xplorer' }

-- Bad
{ desc = 'ex' }
```

### 2. Use Brackets for the Key Letter
```lua
{ desc = '[S]earch files' }  -- Shows which letter to press
```

### 3. Check Existing Keymaps
```vim
:Telescope keymaps
```
Or press `<leader>sk` to search keymaps.

### 4. Test Your Keymap
After adding, press `<leader>` and wait - your new keymap should appear!

### 5. Avoid Conflicts
Check if a keymap already exists:
```vim
:verbose map <leader>x
```

## Common Keymap Patterns

### Save and Quit
```lua
map('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite file' })
map('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit' })
map('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save and e[X]it' })
```

### Window Navigation (already set)
```lua
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
```

### Terminal
```lua
map('n', '<leader>tt', '<cmd>terminal<cr>', { desc = '[T]erminal open' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
```

### Clipboard
```lua
map('v', '<leader>y', '"+y', { desc = '[Y]ank to clipboard' })
map('n', '<leader>p', '"+p', { desc = '[P]aste from clipboard' })
```

## Example: Complete Git Group

```lua
-- In which-key spec:
{ '<leader>g', group = '[G]it' },

-- Keymaps:
vim.keymap.set('n', '<leader>gs', '<cmd>Git status<cr>', { desc = 'Git [S]tatus' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git [P]ush' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Git [L]og' })
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>', { desc = 'Git [D]iff' })
```

Now you can customize your keymaps however you like! 🎉
