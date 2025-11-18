return {
    "mikavilpas/yazi.nvim",
    version = "*",
    keys = {
        {
            "<leader>y",
            "<cmd>Yazi<CR>",
            mode = "n",
            desc = "Open Yazi",
        },
    },
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    opts = {
        open_for_directories = false,
        keymaps = {
            show_help = "<f1>",
            open_file_in_vertical_split = "<M-o>",
            open_file_in_horizontal_split = "<M-i>",
        },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
}
