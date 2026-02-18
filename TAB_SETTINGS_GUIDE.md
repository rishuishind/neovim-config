# Tab and Indentation Settings Guide 📏

Your Neovim is now configured to use **4 spaces** for indentation.

## Current Settings

```lua
vim.o.tabstop = 4        -- Tab character displays as 4 spaces
vim.o.softtabstop = 4    -- Pressing Tab inserts 4 spaces
vim.o.shiftwidth = 4     -- Auto-indent uses 4 spaces
vim.o.expandtab = true   -- Convert tabs to spaces
vim.o.smartindent = true -- Smart auto-indenting
```

## What Each Setting Does

### 1. `tabstop = 4`
**What it does:** Controls how many spaces a **real Tab character** (`\t`) displays as.

**Example:** If a file has actual tab characters, they'll appear as 4 spaces wide.

### 2. `softtabstop = 4`
**What it does:** When you press the **Tab key**, it inserts 4 spaces.

**Example:**
```typescript
function hello() {
<Tab>console.log("hello");  // Pressing Tab adds 4 spaces
}
```

### 3. `shiftwidth = 4`
**What it does:** Controls indentation for:
- `>>` - Indent line right
- `<<` - Indent line left
- Auto-indentation (when you press Enter after `{`)

**Example:**
```typescript
if (true) {
<Enter>  // Auto-indents 4 spaces
```

### 4. `expandtab = true`
**What it does:** Converts Tab key presses to **spaces** instead of tab characters.

**Why?** Spaces are more consistent across different editors and systems.

### 5. `smartindent = true`
**What it does:** Automatically adds proper indentation for code structures.

**Example:**
```typescript
function test() {
<Enter>  // Automatically indents here
```

## How It Works in Practice

### When You Press Tab:
1. **In Insert mode at start of line:** Adds 4 spaces
2. **In Insert mode mid-line:** Adds 4 spaces
3. **In Normal mode:** Use `>>` to indent (adds 4 spaces)

### Visual Example:

```typescript
// Starting here (cursor at |)
function example() {
|
```

**Press Tab:**
```typescript
function example() {
····|  // 4 spaces added (shown as dots)
```

**Type code and press Enter:**
```typescript
function example() {
····if (true) {
········|  // Auto-indented 8 spaces (4 + 4)
```

## Useful Commands

### Indentation Commands (Normal Mode)
- `>>` - Indent current line right (add 4 spaces)
- `<<` - Indent current line left (remove 4 spaces)
- `==` - Auto-indent current line
- `gg=G` - Auto-indent entire file
- `=` - Auto-indent selected lines (in Visual mode)

### Visual Mode Indentation
1. Select lines with `V` (Visual Line mode)
2. Press `>` to indent right
3. Press `<` to indent left
4. Press `.` to repeat

### Check Current Settings
```vim
:set tabstop?      " Shows: tabstop=4
:set softtabstop?  " Shows: softtabstop=4
:set shiftwidth?   " Shows: shiftwidth=4
:set expandtab?    " Shows: expandtab (if on)
```

## File-Specific Overrides

The `guess-indent.nvim` plugin will detect indentation from existing files:
- If a file uses 2 spaces, it adapts to 2 spaces
- If a file uses tabs, it adapts to tabs
- Your default (4 spaces) applies to new files

### Disable Auto-Detection for a File
```vim
:set tabstop=4 softtabstop=4 shiftwidth=4
```

## Common Scenarios

### Scenario 1: Fixing Inconsistent Indentation
```vim
gg=G  " Auto-indent entire file to 4 spaces
```

### Scenario 2: Convert Tabs to Spaces
```vim
:retab  " Converts all tabs to spaces using current settings
```

### Scenario 3: Indent Multiple Lines
1. Visual select lines: `V` then `j` or `k`
2. Press `>` to indent
3. Press `.` to repeat if needed

### Scenario 4: Quick Indent in Insert Mode
- `Ctrl+T` - Indent current line
- `Ctrl+D` - Un-indent current line

## Different Languages

If you want different indentation for specific languages:

```lua
-- Add to init.lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript', 'typescriptreact' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
```

## Troubleshooting

### Tab adds 2 spaces instead of 4?
The file might have existing 2-space indentation. `guess-indent` detected it.

**Fix:** Manually set for this file:
```vim
:set tabstop=4 softtabstop=4 shiftwidth=4
```

### Seeing weird characters for tabs?
You have actual tab characters. Convert them:
```vim
:retab
```

### Want to see spaces/tabs visually?
Already enabled! Look for:
- `·` for trailing spaces
- `» ` for tabs

## Summary

**When you press Tab:** 4 spaces are inserted
**Auto-indent amount:** 4 spaces
**Where it's controlled:** `softtabstop` and `shiftwidth` settings
**Type of character:** Spaces (not tab characters) because `expandtab = true`

Your code will now be consistently indented with 4 spaces! 🎉
