-- Essential autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  desc = "Go to last location when opening a buffer",
  group = augroup("last-location", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-format on save for specific file types
autocmd("BufWritePre", {
  desc = "Auto-format before save",
  group = augroup("auto-format", { clear = true }),
  pattern = { "*.lua", "*.go", "*.py", "*.yaml", "*.yml", "*.json" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Advanced autocommands (commented out for simplicity)
-- Uncomment these as you get more comfortable:

-- -- Close some filetypes with <q>
-- autocmd("FileType", {
--   desc = "Close certain filetypes with <q>",
--   group = augroup("close_with_q", { clear = true }),
--   pattern = { "help", "lspinfo", "man", "qf", "checkhealth" },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--   end,
-- })

-- -- Auto-create directories when saving files
-- autocmd("BufWritePre", {
--   desc = "Auto create dir when saving a file",
--   group = augroup("auto_create_dir", { clear = true }),
--   callback = function(event)
--     local file = vim.uv.fs_realpath(event.match) or event.match
--     vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
--   end,
-- })