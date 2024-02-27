return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = true,
  languages = {
    python = {
      template = {
        annotation_convention = 'google_docstrings',
      },
    },
  },
  -- keys = {},
  -- opts = {},
}
