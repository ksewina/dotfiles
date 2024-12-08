-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- :h option-list
reload("ks.options")

lvim.plugins = {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    }
}

-- Tmux Navigator key bindings
vim.g.tmux_navigator_save_on_switch = 2  -- Save on tmux/vim split switch
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<cr>', { silent = true })
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<cr>', { silent = true })
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<cr>', { silent = true })
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<cr>', { silent = true })
vim.keymap.set('n', '<C-\\>', ':TmuxNavigatePrevious<cr>', { silent = true })
