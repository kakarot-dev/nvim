local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require "lspconfig/util"

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  filetypes = { "c", "cpp", "c++" },
  capabilites = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilites = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "prisma" },
  root_dir = util.root_pattern(".git", "package.json"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern(".git", "requirements.txt"),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        pydocstyle = {
          enabled = false,
        },
        pylint = {
          enabled = false,
        },
        flake8 = {
          enabled = true,
        },
        jedi_completion = {
          enabled = true,
        },
        mypy = {
          enabled = true,
        },
        yapf = {
          enabled = true,
        },
        isort = {
          enabled = true,
        },
      },
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
