return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  cond = function()
    return not require('config.env').remote_ssh_session()
  end,
  opts = {
    flavour = 'mocha',
    transparent_background = false,
    integrations = {
      treesitter = true,
      fzf = true,
      native_lsp = { enabled = true },
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
