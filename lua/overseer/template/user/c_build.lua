return {
  name = "C Build",
  builder = function()
    return {
      cmd = { "./build.sh" },
      components = {
        {
          "on_output_quickfix",
          open = false,
          open_on_exit = "never",
        },
        "user.open_quickfix_vertical",
        "default",
      },
    }
  end,
  condition = { filetype = { "c" } },
}
