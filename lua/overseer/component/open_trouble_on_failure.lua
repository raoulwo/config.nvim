return {
  desc = "Open Trouble quickfix list when build fails",
  constructor = function()
    local overseer = require("overseer")
    return {
      on_complete = function(_, _, status)
        if status == overseer.STATUS.FAILURE then
          vim.schedule(function()
            vim.cmd("Trouble qflist open focus=true")
          end)
        end
      end,
    }
  end,
}
