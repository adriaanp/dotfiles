return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cs = {},
      javascript = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer"
    },
  },
}
