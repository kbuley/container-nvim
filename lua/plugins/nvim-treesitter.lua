return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "comment")
    table.insert(opts.ensure_installed, "cue")
    table.insert(opts.ensure_installed, "editorconfig")
    table.insert(opts.ensure_installed, "gotmpl")
    table.insert(opts.ensure_installed, "graphql")
    table.insert(opts.ensure_installed, "jq")
    table.insert(opts.ensure_installed, "make")
    table.insert(opts.ensure_installed, "proto")
    table.insert(opts.ensure_installed, "sql")
    table.insert(opts.ensure_installed, "tmux")
    table.insert(opts.ensure_installed, "toml")

    -- Remove jsonc from ensure_installed
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "jsonc"
      end, opts.ensure_installed)
    end

    -- Use json parser for jsonc files
    vim.treesitter.language.register("json", "jsonc")
  end,
}
