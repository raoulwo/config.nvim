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
        end, { desc = "[GIT] Jump to previous change" })
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "[GIT] Jump to next change" })

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[GIT] Stage hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[GIT] Reset hunk" })

        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[GIT] Stage hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[GIT] Reset hunk" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[GIT] Stage buffer" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[GIT] Reset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[GIT] Preview hunk" })
        map("n", "<leader>hb", gitsigns.blame_line, { desc = "[GIT] Show blame line" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "[GIT] Diff against index" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("@")
        end, { desc = "[GIT] Diff against last commit" })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[GIT] Toggle blame line" })
      end,
    },
  },
}
