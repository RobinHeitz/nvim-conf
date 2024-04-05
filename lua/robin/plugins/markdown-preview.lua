return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,

  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", { desc = "Open markdown preview" })
    keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
    keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Close markdown preview" })
  end,
}
