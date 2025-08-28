-- Telescope fuzzy finder
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8", -- Use latest stable version
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Better sorting
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous", -- move to prev result
            ["<C-j>"] = "move_selection_next", -- move to next result
            ["<C-q>"] = "send_selected_to_qflist", -- send selected to quickfixlist
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
          hidden = false,
        },
        live_grep = {
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
      },
    })

    -- Load fzf extension for better performance
    pcall(telescope.load_extension, "fzf")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })
  end,
}