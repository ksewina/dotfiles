-- Neo-tree file explorer
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        filtered_items = {
          visible = false,
          hide_gitignored = true,
          hide_dotfiles = false,
        },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },

      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none", -- Disable space since it's our leader
        },
      },

      -- Hide certain files
      filesystem_watchers = {
        ignore_directories = {
          "node_modules",
          ".git",
          ".venv",
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Focus file explorer" })
  end,
}

