return {
  "someone-stole-my-name/yaml-companion.nvim",
  config = function()
    require("telescope").load_extension("yaml_schema")
  end,
  requires = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
}
}
