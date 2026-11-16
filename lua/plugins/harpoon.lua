return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({})

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        pickers
          .new({}, {
            prompt_title = "Harpoon",
            finder = finders.new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      vim.keymap.set("n", "<leader>H", function()
        toggle_telescope(harpoon:list())
      end, { desc = "[Harpoon] Toggle Harpoon" })

      vim.keymap.set("n", "<leader>m", function()
        harpoon:list():add()
      end, { desc = "[Harpoon] Add mark" })

      for idx = 1, 5 do
        local cmd = string.format("<leader>%d", idx)
        vim.keymap.set("n", cmd, function()
          harpoon:list():select(idx)
        end, { desc = "[Harpoon] Jump to mark " .. idx })
      end
    end,
  },
}
