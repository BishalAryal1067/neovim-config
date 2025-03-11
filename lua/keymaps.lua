keymap = vim.keymap

--lsp related keymaps
keymap.set('n', '<C-h>', vim.lsp.buf.hover)
keymap.set('n', '<C-d>', vim.lsp.buf.definition)

--nvim tree
keymap.set('n', '<Leader>n', ':NvimTreeToggle<CR>')

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



