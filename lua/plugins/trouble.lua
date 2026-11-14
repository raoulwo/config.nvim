return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {
      focus = true,
    },
    keys = {
      {
        "<leader>d",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "[Trouble] Toggle diagnostics",
      },
      {
        "<leader>D",
        "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
        desc = "[Trouble] Toggle diagnostics for current buffer",
      },
      {
        "<leader>l",
        "<cmd>Trouble loclist toggle<CR>",
        desc = "[Trouble] Toggle location list",
      },
      {
        "<leader>q",
        "<cmd>Trouble qflist toggle<CR>",
        desc = "[Trouble] Toggle quickfix list",
      },
      {
        "<leader>tf",
        "<cmd>Trouble telescope_files toggle<CR>",
        desc = "[Trouble] Toggle telescope files",
      },
      {
        "<leader>tt",
        "<cmd>Trouble telescope toggle<CR>",
        desc = "[Trouble] Toggle telescope",
      },
    },
  },
}
