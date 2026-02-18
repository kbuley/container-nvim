return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup({
      max_length = 0, -- Unlimited
      silent = false, -- Show messages
      trim = false, -- Don't trim whitespace
    })

    -- Auto-copy to system clipboard on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" then
          require("osc52").copy(vim.fn.getreg('"'))
        end
      end,
    })

    -- Optional: manual copy mappings
    vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
    vim.keymap.set("n", "<leader>yy", "<leader>y_", { remap = true })
    vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)
  end,
}
