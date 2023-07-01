vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap('n', '<leader>e', vim.cmd.Ex)
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

keymap('n', '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', '"+Y', opts)

keymap('v', 'p', '"_dP', opts)
keymap({ 'n', 'v' }, '<leader>d', '"_dP')

keymap('n', '<leader>f', vim.lsp.buf.format)

keymap('n', '<leader>x', vim.cmd.bdelete, opts)
keymap('n', '<leader>xx', function() vim.cmd('%bd') end, opts)
