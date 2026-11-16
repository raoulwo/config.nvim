local state = {
  buf = -1,
  win = -1,
}

local toggle_terminal = function()
  local current_buf = vim.api.nvim_get_current_buf()
  if current_buf == state.buf then
    vim.cmd("b#")
    return
  end

  if vim.api.nvim_buf_is_valid(state.buf) then
    vim.api.nvim_set_current_buf(state.buf)
    state.win = vim.api.nvim_get_current_win()
  else
    vim.cmd("terminal")
    state.buf = vim.api.nvim_get_current_buf()
    state.win = vim.api.nvim_get_current_win()
  end
end

vim.keymap.set("n", "<leader>\\", toggle_terminal, { desc = "[Terminal] Toggle Terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "[Terminal] Enter normal mode" })
