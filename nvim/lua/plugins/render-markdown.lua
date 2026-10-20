return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { 'markdown' },
  keys = {
    { '<leader>m', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle markdown render' },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    anti_conceal = { enabled = false },
    win_options = {
      wrap = { default = vim.o.wrap, rendered = true },
      linebreak = { default = vim.o.linebreak, rendered = true },
    },
  },
}
