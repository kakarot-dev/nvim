local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start of continue the debugger",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}
M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
}
M.projects = {
  n = {
    ["<leader>op"] = {
      "<cmd> ProjectMgr<CR>",
      "Open project manager",
    },
    ["<leader>bf"] = {
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "Format file",
    },
  },
}
M.lazyGit = {
  n = {
    ["<leader>lg"] = {
      "<cmd> LazyGit <CR>",
      "Open lazygit",
    },
  },
}
return M
