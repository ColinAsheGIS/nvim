return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'flake8' },
    }

    -- path/to/file:line:col: code message
    local pattern = '[^:]+:(%d+):(%d+):(%w+):(.+)'
    local groups = { 'lnum', 'col', 'code', 'message' }

    lint.linters.flake8 = {
      name = 'flake8',
      cmd = 'flake8',
      stdin = true,
      args = {
        '--max-line-length=80 ', -- Using 80 instead of 79 for black and isort
        '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
        '--no-show-source',
        '--stdin-display-name',
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
        '-',
      },
      ignore_exitcode = true,
      parser = require('lint.parser').from_pattern(pattern, groups, nil, {
        ['source'] = 'flake8',
        ['severity'] = vim.diagnostic.severity.WARN,
      }),
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file.' })
  end,
}
