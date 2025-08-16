require("wap.keymaps")
require("wap.options")
require("wap.lsp")
require("wap.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local highlight_group = augroup("YankHighlight", {})

autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

