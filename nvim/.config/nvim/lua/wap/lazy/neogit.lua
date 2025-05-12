return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local ng = require('neogit')

    vim.keymap.set('n', '<leader>ng', ng.open, { desc = '[N]eo[G]it' })
  end,
}
