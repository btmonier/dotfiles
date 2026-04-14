return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {},
  init = function()
    local parsers = {
      'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline',
      'python', 'query', 'vim', 'vimdoc', 'json', 'yaml', 'toml',
      'html', 'css', 'javascript', 'typescript',
    }

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyDone',
      once = true,
      callback = function()
        local installed = require('nvim-treesitter.config').get_installed()
        local to_install = vim.iter(parsers)
          :filter(function(p) return not vim.tbl_contains(installed, p) end)
          :totable()
        if #to_install > 0 then
          require('nvim-treesitter').install(to_install)
        end
      end,
    })
  end,
}
