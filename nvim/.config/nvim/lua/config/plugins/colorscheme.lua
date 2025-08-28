-- Colorscheme configuration
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load first
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false, -- We use neo-tree
        treesitter = true,
        telescope = {
          enabled = true,
        },
        mason = true,
        which_key = true,
        -- Neo-tree integration might not be available in older versions
        -- neo_tree = true,
      },
    })
    
    -- Set colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}