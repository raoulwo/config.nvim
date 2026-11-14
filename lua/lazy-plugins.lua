require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  ui = {
    border = "rounded",
    size = { width = 0.8, height = 0.8 },
  },
})
