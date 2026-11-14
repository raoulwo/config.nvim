return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        -- NOTE: See `:help gisigns`
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "[Git] Jump to previous change" })
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "[Git] Jump to next change" })

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[Git] Stage hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[Git] Reset hunk" })

        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[Git] Stage hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[Git] Reset hunk" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[Git] Stage buffer" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[Git] Reset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[Git] Preview hunk" })
        map("n", "<leader>hb", gitsigns.blame_line, { desc = "[Git] Show blame line" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "[Git] Diff against index" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("@")
        end, { desc = "[Git] Diff against last commit" })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[Git] Toggle blame line" })
      end,
    },
  },
}
