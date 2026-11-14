return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "smart-history")
      pcall(require("telescope").load_extension, "ui-select")

      -- NOTE: See `:h telescope.builtin`
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "Search builtin" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search grep" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
      vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Search old files" })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search buffers" })
      vim.keymap.set("n", "<leader>.", builtin.resume, { desc = "Resume last search" })

      vim.keymap.set("n", "<leader>sc", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Search neovim config" })

      vim.keymap.set("n", "<leader>sn", "<cmd>Telescope notify<CR>", { desc = "Search notifications " })
    end,
  },
}
