return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "dockerls",
        "docker_compose_language_service",
        "elixirls",
        "gopls",
        "helm_ls",
        "yamlls"
      }
  })
  end
}
