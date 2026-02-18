-- Shows colors inline in your code (hex, rgb, tailwind, etc.)
return {
  'NvChad/nvim-colorizer.lua',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('colorizer').setup {
      filetypes = {
        '*',
        css = { css = true },
        scss = { css = true },
        html = { names = true },
        javascript = { tailwind = true },
        javascriptreact = { tailwind = true },
        typescript = { tailwind = true },
        typescriptreact = { tailwind = true },
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = 'background',
        tailwind = true,
        sass = { enable = true, parsers = { 'css' } },
        virtualtext = '■',
        always_update = false,
      },
      buftypes = {},
    }
  end,
}
