local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "K", ":m '< -2<CR>gv=gv", { desc = "moves lines up in visual selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selction" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Code Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


--Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("Kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>pp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })


-- Move between splits with Alt + h/j/k/l
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })

-- Open vertical split with Alt + o
vim.keymap.set("n", "<A-o>", ":vsplit<CR>", { noremap = true, silent = true })

-- Open horizontal split with Alt + i
vim.keymap.set("n", "<A-i>", ":split<CR>", { noremap = true, silent = true })

-- Close all splits except current with Alt + p
vim.keymap.set("n", "<A-p>", "<C-w>o", { noremap = true, silent = true })

-- Resize
vim.keymap.set("n", "<A-=>", "<C-w>=", { silent = true, desc = "Equalize splits" })
vim.keymap.set("n", "<A-.>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<A-,>", "<C-w><", { silent = true })
vim.keymap.set("n", "<A-m>", "<C-w>|", { silent = true, desc = "Maximize width" })

-- Swap splits (Alt + Shift + h/j/k/l)
vim.keymap.set("n", "<A-S-h>", "<C-w>H", { silent = true, desc = "Swap split left" })
vim.keymap.set("n", "<A-S-j>", "<C-w>J", { silent = true, desc = "Swap split down" })
vim.keymap.set("n", "<A-S-k>", "<C-w>K", { silent = true, desc = "Swap split up" })
vim.keymap.set("n", "<A-S-l>", "<C-w>L", { silent = true, desc = "Swap split right" })
