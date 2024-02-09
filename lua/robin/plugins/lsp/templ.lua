local lspconfig = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local servers = { "gopls", "ccls", "cmake", "tsserver", "templ" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end


-- Format current buffer using LSP.
vim.api.nvim_create_autocmd({
	-- 'BufWritePre' event triggers just before a buffer is written to file.
	"BufWritePre",
}, {
	pattern = { "*.templ" },
	callback = function()
		-- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
		vim.lsp.buf.format()
	end,
})

