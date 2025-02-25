vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- quickfix window settings
keymap.set("n", "<leader>cf", "<cmd>cfirst<CR>", { desc = "Open first quickfix" }) --  move current buffer to new tab
keymap.set("n", "<leader>cn", "<cmd>cn<CR>", { desc = "Next quickfix" }) --  move current buffer to new tab
keymap.set("n", "<leader>cp", "<cmd>cp<CR>", { desc = "Previous quickfix" }) --  move current buffer to new tab
keymap.set("n", "<leader>cl", "<cmd>cl<CR>", { desc = "Show quickfix list" }) --  move current buffer to new tab
keymap.set("n", "<leader>cx", "<cmd>cexpr []<CR>", { desc = "Clear quickfix list" }) --  move current buffer to new tab

-- Dap setup
keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })

-- Remap move to opening and closing brackets
keymap.set("n", "t", "%", { desc = "Move to start/ end of function scope" }) -- increment

--
keymap.set("n", "ff", "<cmd> AerialToggle<CR>", { desc = "Toggle Aerial on right side" })
keymap.set("n", "<leader>fn", "<cmd> AerialNavToggle<CR>", { desc = "Toggle Aerial nav window" })
keymap.set("n", "}", "<cmd> AerialNext<CR>", { desc = "Go to next function" })
keymap.set("n", "{", "<cmd> AerialPrev<CR>", { desc = "Go to previous function" })
