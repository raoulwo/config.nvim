return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function()
      local overseer = require("overseer")

      overseer.setup()

      overseer.add_template_hook({
        name = "^make",
      }, function(task_defn, util)
        util.add_component(task_defn, {
          "on_output_quickfix",
          tail = false,
          open = false,
          open_on_exit = "never",
          items_only = true,
          errorformat = vim.o.errorformat,
        })

        util.add_component(task_defn, { "open_trouble_on_failure" })
      end)

      vim.keymap.set("n", "<leader>b", "<cmd>OverseerRun<CR>", { desc = "Run Overseer" })
      vim.keymap.set("n", "<leader>o", "<cmd>OverseerToggle<CR>", { desc = "Toggle Overseer" })
    end,
  },
}
