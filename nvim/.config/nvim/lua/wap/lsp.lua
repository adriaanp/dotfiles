local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.diagnostic.config({
  virtual_text = { current_line = true }
})

local wapGroup = augroup("WapGroup", {})

autocmd("LspAttach", {
  group = wapGroup,
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<F12>", vim.lsp.buf.declaration, opts)
  end,
})
