return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "elixir", "rego", "dockerfile", "go", "toml", "yaml"},
      sync_install = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
