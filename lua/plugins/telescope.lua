return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local open_with_trouble = require("trouble.sources.telescope").open
      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<C-t>"] = open_with_trouble },
            n = { ["<C-t>"] = open_with_trouble },
          },
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          fzf = {},
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "smart-history")
      pcall(require("telescope").load_extension, "ui-select")

      -- NOTE: See `:h telescope.builtin`
      local builtin = require("telescope.builtin")

      local map = function(mode, cmd, fn, desc)
        vim.keymap.set(mode, cmd, fn, { desc = "[Telescope] " .. desc })
      end

      map("n", "<leader>sb", builtin.builtin, "Search builtin")
      map("n", "<leader>sd", builtin.diagnostics, "Search diagnostics")
      map("n", "<leader>sf", builtin.find_files, "Search files")
      map("n", "<leader>sh", builtin.help_tags, "Search help")
      map("n", "<leader>sk", builtin.keymaps, "Search keymaps")
      map("n", "<leader>sw", builtin.grep_string, "Search current word")
      map("n", "<leader>so", builtin.oldfiles, "Search old files")
      map("n", "<leader><leader>", builtin.buffers, "Search buffers")
      map("n", "<leader>.", builtin.resume, "Resume last search")
      map("n", "<leader>sn", "<cmd>Telescope notify<CR>", "Search notifications")

      map("n", "<leader>sc", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, "Search neovim config")
      map("n", "<leader>sp", function()
        builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
      end, "Search neovim packages")

      map("n", "<leader>/", function()
        local themes = require("telescope.themes")
        builtin.current_buffer_fuzzy_find(themes.get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, "Fuzzy search in current buffer")

      require("telescope.multigrep").setup()
    end,
  },
}
