return {
  -- `lualine.nvim`
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({})
    end,
  },

  -- `nvim-autopairs`
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- `todo-comments.nvim`
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- `rainbow-delimiters.nvim`
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
}
