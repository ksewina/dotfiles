-- Treesitter syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Essential languages
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "yaml", "json", "toml", "bash",
        "go", "gomod", "gowork", "gosum",
        "python", "javascript", "typescript",
        "html", "css", "markdown", "dockerfile"
      },
      
      sync_install = false,
      auto_install = true,
      
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      indent = { 
        enable = true 
      },
      
      -- Advanced features (commented out for simplicity)
      -- Uncomment these as you get more comfortable:
      
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "<C-space>",
      --     node_incremental = "<C-space>",
      --     scope_incremental = false,
      --     node_decremental = "<bs>",
      --   },
      -- },
    })
  end,
}