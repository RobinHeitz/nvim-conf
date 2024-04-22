local keymap = vim.keymap

-- User command to toggle Diagnostics on/off
vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config({
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  })
end, { desc = "toggle diagnostickk" })

keymap.set("n", "<leader>xo", "<cmd>DiagnosticToggle<CR>", { desc = "Toggle diagnostics" })

-- QuickFix toggle command + binding
vim.api.nvim_create_user_command("QuickFixToggle", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end, { desc = "toggle quickfix as horizontal split" })

keymap.set("n", "<leader>co", "<cmd>QuickFixToggle<CR>", { desc = "toggle quickfix window" })
