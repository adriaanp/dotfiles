return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>")
  end
}
