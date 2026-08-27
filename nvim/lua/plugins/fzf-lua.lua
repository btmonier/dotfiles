return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    'default-title',
    fzf_colors = true,
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = { layout = 'vertical', vertical = 'down:45%' },
    },
  },
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Live grep' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help tags' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
    { '<leader>f/', '<cmd>FzfLua lgrep_curbuf<cr>', desc = 'Grep current buffer' },
  },
}
