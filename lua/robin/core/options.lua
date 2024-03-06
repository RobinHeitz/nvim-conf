local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

vim.cmd([[
                autocmd FileType python setlocal tabstop=4 shiftwidth=4 indent_type="Spaces"
    autocmd FileType html setlocal tabstop=2 shiftwidth=2
]])

-- line wrapping
opt.wrap = false

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

--split window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.swapfile = false
