local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "bash",
    "dockerfile",
    "typescript",
    "python",
    "yaml",
    "json",
    "json5",
  },
}


M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    "bash-language-server",
    "css-lsp",
    "diagnostic-languageserver",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "eslint",
    "jq",
    "js-debug-adapter",
    "json-lsp",
    "markdownlint",
    "prettier",
    "pylint",
    "pyright",
    "rustfmt",
    "stylua",
    "typescript-language-server",
    "yaml-language-server",
    "yamlfmt",

  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
