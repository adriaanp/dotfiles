return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = { 'bash', 'lua', 'typescript', 'vimdoc', 'vim', 'c_sharp' },
    highlight = { enable = true },
    indent = { enable = true, disable = { 'python' } },
    auto_install = true,
  }
}
