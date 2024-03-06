local setup, conform = pcall(require, "conform")
if not setup then
	return
end

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})

conform.setup({
	formatters_by_ft = {
		markdown = { "mdformat" },
		latex = { "latexindent" },
		lua = { "stylua" },
		templ = { "templ" },
		python = { "isort", "black" },
		go = { "goimports", "gofmt" },
		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_format = false,
		async = false,
		timeout_ms = 1000,
	})
end)
