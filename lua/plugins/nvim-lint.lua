return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      linters_by_ft = {
        bash = { "shellcheck" },
        json = { "jsonlint" },
        markdown = { "markdownlint-cli2" },
        proto = { "protolint", "buf_lint" },
        python = { "ruff" },
        sh = { "shellcheck" },
        yaml = { "yamllint" },
        -- Let LazyVim's Go extra add golangcilint
      },
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            vim.fn.stdpath("config") .. "/lua/configs/nvim.markdownlint.jsonc",
            "$FILENAME",
          },
        },
      },
    },
  },
}
