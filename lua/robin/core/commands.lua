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
