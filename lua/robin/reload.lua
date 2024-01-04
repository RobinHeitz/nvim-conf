-- This function is used for fast reloading of the nvim config.
-- It is bound to <leader>nr, as defined in keymaps.lua

function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^robin") and not name:match("nvim-tree") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
