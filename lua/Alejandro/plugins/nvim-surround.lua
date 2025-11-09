-- Using lazy.nvim
return {
  "kylechui/nvim-surround",
  version = "*", -- use latest stable release
  config = function()
    require("nvim-surround").setup({
      -- You can leave empty for defaults
      -- Optional: customize keymaps or surrounds here
    })
  end
}
