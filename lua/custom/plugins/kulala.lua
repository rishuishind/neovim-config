-- Kulala - HTTP client for Neovim (.http / .rest files)
return {
  'mistweaverco/kulala.nvim',
  ft = { 'http', 'rest' },
  keys = {
    -- Request execution
    { '<leader>Rs', '<cmd>lua require("kulala").run()<cr>', desc = '[S]end request' },
    { '<leader>Ra', '<cmd>lua require("kulala").run_all()<cr>', desc = 'Send [a]ll requests' },
    { '<leader>Rr', '<cmd>lua require("kulala").replay()<cr>', desc = '[R]eplay last request' },
    
    -- Navigation
    { '<leader>Rn', '<cmd>lua require("kulala").jump_next()<cr>', desc = 'Jump to [n]ext request' },
    { '<leader>Rp', '<cmd>lua require("kulala").jump_prev()<cr>', desc = 'Jump to [p]revious request' },
    { '<leader>Rf', '<cmd>lua require("kulala").search()<cr>', desc = '[F]ind/search request' },
    
    -- Request management
    { '<leader>Ri', '<cmd>lua require("kulala").inspect()<cr>', desc = '[I]nspect current request' },
    { '<leader>Rt', '<cmd>lua require("kulala").toggle_view()<cr>', desc = '[T]oggle headers/body view' },
    { '<leader>RS', '<cmd>lua require("kulala").show_stats()<cr>', desc = 'Show [S]tats' },
    
    -- Utilities
    { '<leader>Rb', '<cmd>lua require("kulala").scratchpad()<cr>', desc = 'Open scratch[b]ad' },
    { '<leader>Ro', '<cmd>lua require("kulala").open()<cr>', desc = '[O]pen kulala UI' },
    { '<leader>Rc', '<cmd>lua require("kulala").copy()<cr>', desc = '[C]opy as cURL' },
    { '<leader>RC', '<cmd>lua require("kulala").from_curl()<cr>', desc = 'Paste from [C]URL' },
    { '<leader>Re', '<cmd>lua require("kulala").set_selected_env()<cr>', desc = 'Select [e]nvironment' },
    { '<leader>Rx', '<cmd>lua require("kulala").clear_globals()<cr>', desc = 'Clear globals' },
    { '<leader>Rq', '<cmd>lua require("kulala").close()<cr>', desc = '[Q]uit/close window' },
  },
  opts = {
    -- Default environment (dev, staging, production)
    default_env = 'dev',
    
    -- Automatically format JSON responses
    formatters = {
      json = { 'jq', '.' },
      xml = { 'xmllint', '--format', '-' },
      html = { 'tidy', '-i', '-q', '-' },
    },
    
    -- Show icons in the UI
    icons = {
      inlay = {
        loading = '⏳',
        done = '✅',
        error = '❌',
      },
      lualine = '🐼',
    },
    
    -- Additional cURL options
    additional_curl_options = {},
    
    -- Scratchpad default contents
    scratchpad_default_contents = {
      '### New Request',
      'GET {{base_url}}/',
      '',
    },
    
    -- Display mode for the response window
    display_mode = 'split', -- 'split' or 'float'
    
    -- Split direction
    split_direction = 'vertical', -- 'vertical' or 'horizontal'
    
    -- Default headers
    default_headers = {
      ['Content-Type'] = 'application/json',
      ['Accept'] = 'application/json',
    },
    
    -- Winbar configuration
    winbar = true,
    
    -- Enable debug mode
    debug = false,
  },
  config = function(_, opts)
    require('kulala').setup(opts)
    
    -- Register the group in which-key
    local ok, wk = pcall(require, 'which-key')
    if ok then
      wk.add {
        { '<leader>R', group = '[R]EST / HTTP' },
      }
    end
    
    -- Auto-commands for .http files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'http', 'rest' },
      callback = function()
        -- Set local options for better editing
        vim.opt_local.wrap = false
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
        vim.opt_local.cursorline = true
        
        -- Additional buffer-local keymaps
        local opts = { buffer = true, silent = true }
        vim.keymap.set('n', '<CR>', '<cmd>lua require("kulala").run()<cr>', vim.tbl_extend('force', opts, { desc = 'Send request' }))
        vim.keymap.set('n', '[r', '<cmd>lua require("kulala").jump_prev()<cr>', vim.tbl_extend('force', opts, { desc = 'Previous request' }))
        vim.keymap.set('n', ']r', '<cmd>lua require("kulala").jump_next()<cr>', vim.tbl_extend('force', opts, { desc = 'Next request' }))
      end,
    })
    
    -- Highlight groups for better visibility
    vim.api.nvim_set_hl(0, 'KulalaRequest', { link = 'Title' })
    vim.api.nvim_set_hl(0, 'KulalaVariable', { link = 'Identifier' })
    vim.api.nvim_set_hl(0, 'KulalaComment', { link = 'Comment' })
  end,
}
