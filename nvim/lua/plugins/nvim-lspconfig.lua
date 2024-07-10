-- :h vim.lsp.buf
return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.helm_ls.setup({})
    lspconfig.yamlls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "yml", "yaml", "yaml.docker-compose", "config" },
      settings = {
        redhat = {
          telemetry = {
            enabled = false
          }
        },
        yaml = {
          format = { enabled = true },
          validate = false,
          schemaDownload = { enable = true },
          completion = true,
          hover = true,
          schemas = {
           kubernetes = { "/*.yaml" },
           ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
           ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
           ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
          },
        }
      }

    })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
  end
}
