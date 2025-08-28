-- Alpha.nvim dashboard
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- Set header with custom ASCII art
    dashboard.section.header.val = vim.split(
      [[
                                             * )
                                         `(      *
                   ()                   *     )
                  <^^>                     (   .
                 .-""-.                      )
      .---.    ."-....-"-._     _...---''`/. '
     ( (`\ \ .'            ``-''    _.-"'`
      \ \ \ : :.                 .-'
       `\`.\: `:.             _.'
       (  .'`.`            _.'
        ``    `-..______.-'
                  ):.  (
                ."-....-".
              .':.        `.
              "-..______..-"

      ]],

      "\n",
      {}
    )
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    -- Set footer
    local function footer()
      local total_plugins = #vim.tbl_keys(require("lazy").plugins())
      local datetime = os.date("  %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end
    dashboard.section.footer.val = footer()
    -- Settings
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true
    -- Setup
    alpha.setup(dashboard.opts)
    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

