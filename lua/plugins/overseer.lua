return {
  "stevearc/overseer.nvim",
  opts = {
    strategy = "terminal",
    task_list = {
      direction = "right",
      min_height = 15,
      max_height = 20,
      default_detail = 1,
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)

    vim.keymap.set("n", "<leader>b", "<cmd>OverseerRun<CR>", { desc = "Build or compile" })
    vim.keymap.set("n", "<leader>to", "<cmd>OverseerToggle<CR>", { desc = "Toggle Overseer" })
    vim.keymap.set("n", "<leader>q", function()
      local qf_info = vim.fn.getqflist({ winid = 0 })
      if qf_info.winid ~= 0 then
        vim.cmd("cclose")
      else
        vim.cmd("botright vertical copen")
        vim.cmd("vertical resize 50")
      end
    end, { desc = "Toggle quickfix list" })
  end,
}
