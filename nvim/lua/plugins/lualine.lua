return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local remote = require('config.env').remote_ssh_session()
    return {
      options = {
        theme = remote and 'gruvbox-material' or 'catppuccin-mocha',
        icons_enabled = true,
      },
    }
  end,
}
