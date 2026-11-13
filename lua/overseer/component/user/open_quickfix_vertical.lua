return {
  desc = "Open quickfix in a vertical split on failure",
  constructor = function()
    return {
      on_complete = function(self, task, status)
        if status == "FAILURE" then
          vim.cmd("botright vertical copen")
          vim.cmd("vertical resize 50")
        end
      end,
    }
  end,
}
