-- Keymaps configuration

local telescope = require('telescope.builtin')

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'File browser' })

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Better indent
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Clear search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', { desc = 'Clear search highlight', silent = true })
