return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    event = "VeryLazy",
    cmd = "Telescope",
    keys = {
        { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
        { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end,
            desc = "[/] Fuzzily search in current buffer",
        },
        { "<leader>ths", "<cmd>Telescope themes<cr>", desc = "Theme Switcher" },
        -- Fixed: Ctrl+Space mapping
        { "<C-Space>", "<cmd>Telescope find_files<cr>", desc = "Find files", mode = {"n", "i"} },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                path_display = { "smart" },
            },
            extensions = {
                themes = {
                    enable_previewer = true,
                    enable_live_preview = true,
                    persist = {
                        enabled = true,
                        path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                    },
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        previewer = false,
                    }),
                },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("themes")
        telescope.load_extension("ui-select")
    end,
}
