
if vim.fn.has("mac") == 1 then
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_activate=1
    vim.g.vimtex_view_skim_sync=1
    vim.g.vimtex_view_skim_reading_bar=1


elseif vim.fn.has("unix") == 1 then
    vim.g.vimtex_view_method = 'zathura'

else
    print("WARNING: Not supported OS!!!")
end

vim.cmd([[

nmap <localleader>v <plug>(vimtex-view)

]])
