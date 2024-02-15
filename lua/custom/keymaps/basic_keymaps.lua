
-- [[ Basic Keymaps ]]
local remap = require('custom.keymaps.keymap_utils').remap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
remap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
remap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
remap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
remap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
remap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
remap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
remap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Scrolling in window
remap('n', '<C-d>', '<C-d>zz')
remap('n', '<C-u>', '<C-u>zz')

-- Buffer swapping
remap('n', '<Tab>', vim.cmd.bnext, {desc = "Go to next buffer"})
remap('n', '<S-Tab>', vim.cmd.bprevious, {desc = "Go to prev buffer"})
remap('n', '<leader>x', vim.cmd.bd, {desc = "Unload current buffer"})
