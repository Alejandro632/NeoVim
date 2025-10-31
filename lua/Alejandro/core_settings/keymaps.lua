local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v" , "K" , ":m '< -2<CR>gv=gv", {desc = "moves lines up in visual selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selction" })

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Code Formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--Highlight yank
vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("Kickstart-highlight-yank", {clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

