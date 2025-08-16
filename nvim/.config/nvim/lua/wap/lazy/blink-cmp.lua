return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip" },
  version = "1.*",
  opts = {
    snippets = { preset = "luasnip" },

    keymap = {
      preset = "enter",
      ["<CR>"] = { "select_and_accept", "fallback" },
    },

    completion = {
      list = { selection = { preselect = false, auto_insert = false } },

      ghost_text = { enabled = true },

      documentation = { auto_show = true },
    },

    signature = { enabled = true },
  },
}
