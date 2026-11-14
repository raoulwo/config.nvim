-- Clear search hits when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

-- Keep screen centered when using <C-d> or <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Easier window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- Easier window resizing
vim.keymap.set("n", "<C-w>+", "<cmd>resize +5<CR>", { desc = "Increase window height by 5" })
vim.keymap.set("n", "<C-w>-", "<cmd>resize -5<CR>", { desc = "Decrease window height by 5" })
vim.keymap.set("n", "<C-w>>", "<cmd>vertical resize +10<CR>", { desc = "Increase window width by 10" })
vim.keymap.set("n", "<C-w><", "<cmd>vertical resize -10<CR>", { desc = "Decrease window width by 10" })

-- Move visual selection up/down while keeping indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Remap `&` to reuse flags
vim.keymap.set("n", "&", "<cmd>&&<CR>", { desc = "Repeat substitution with flags" })
vim.keymap.set("x", "&", "<cmd>&&<CR>", { desc = "Repeat substitution with flags" })

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Open Mason" })
vim.keymap.set("n", "\\", "<cmd>Oil<CR>", { desc = "Open Oil" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Jump to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open error message" })

vim.keymap.set({ "n", "v" }, "<leader>rf", "<cmd>Format<CR>", { desc = "Format file or selection" })
