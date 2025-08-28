-- Git integration
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      current_line_blame = false, -- Toggle with keymap
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
      },
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame" })
    
    -- Advanced git keymaps (commented out for simplicity)
    -- Uncomment these as you get more comfortable:
    
    -- vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    -- vim.keymap.set("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
    -- vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
    -- vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
    -- vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
  end,
}