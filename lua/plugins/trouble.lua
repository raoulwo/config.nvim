return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>d",
        "<cmd>Trouble diagnostics toggle focus=true<CR>",
        desc = "[Trouble] Toggle diagnostics",
      },
      {
        "<leader>D",
        "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<CR>",
        desc = "[Trouble] Toggle diagnostics for current buffer",
      },
      {
        "<leader>l",
        "<cmd>Trouble loclist toggle focus=true<CR>",
        desc = "[Trouble] Toggle location list",
      },
      {
        "<leader>q",
        "<cmd>Trouble qflist toggle focus=true<CR>",
        desc = "[Trouble] Toggle quickfix list",
      },
    },
  },
}
