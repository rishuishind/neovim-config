# Custom Plugins for Web Development

This directory contains custom plugins added to your Kickstart Neovim configuration for web development.

## Added Features

### 1. Buffer Line (`bufferline.lua`)
Shows open buffers at the top of your editor, similar to tabs in other editors.

**Keymaps:**
- `<Tab>` - Next buffer
- `<Shift-Tab>` - Previous buffer
- `<leader>bd` - Delete current buffer
- `<leader>bp` - Pick a buffer to switch to
- `<leader>bc` - Pick a buffer to close

### 2. Color Preview (`colorizer.lua`)
Shows colors inline in your code for:
- Hex colors (#ffffff)
- RGB/RGBA colors
- HSL colors
- Tailwind CSS classes (shows the actual color)
- CSS color names

### 3. JSON Schema Support (`schemastore.lua`)
Provides JSON schema validation and autocompletion for common JSON files like:
- package.json
- tsconfig.json
- .eslintrc.json
- And many more

## LSP Servers Installed

The following Language Servers are configured for web development:

1. **tailwindcss** - Tailwind CSS IntelliSense with color previews
2. **cssls** - CSS/SCSS/Less language server
3. **html** - HTML language server
4. **emmet_ls** - Emmet abbreviations for HTML/CSS
5. **eslint** - ESLint for JavaScript/TypeScript linting
6. **jsonls** - JSON language server with schema support
7. **ts_ls** - TypeScript/JavaScript language server

## Formatters

- **prettier** - Formats JavaScript, TypeScript, CSS, HTML, JSON, and Markdown files

## Installation

After starting Neovim:
1. Run `:Lazy sync` to install all plugins
2. Run `:Mason` to check LSP installation status
3. Restart Neovim

All LSP servers and tools will be automatically installed via Mason.

## Usage

When you open a Next.js project:
- Tailwind classes will show color previews
- CSS colors will be highlighted inline
- Full IntelliSense for HTML, CSS, JavaScript, and TypeScript
- Emmet abbreviations work in JSX/TSX files
- ESLint diagnostics appear in real-time
- Format on save is enabled by default
