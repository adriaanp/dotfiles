local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
})

-- local cmp_sources = lsp.defaults.cmp_sources()

-- table.insert(cmp_sources, {name = 'nvim_lsp'})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  lsp.default_keymaps({buffer = bufnr})
  
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
