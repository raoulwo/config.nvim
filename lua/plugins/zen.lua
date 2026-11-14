return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          height = 1.0,
          width = 0.8,
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            cursorline = false,
            list = false,
          },
        },
      })

      require("twilight").setup({ treesitter = true })

      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle zen mode" })
    end,
  },

  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({ treesitter = true })
    end,
  },
}
