return {
  "Alexis12119/nightly.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightly").setup {
      transparent = false,
      styles = {
        comments = { italic = true },
        functions = { italic = true },
        variables = { italic = true },
        keywords = { italic = true },
        -- strings = { italic = true },
      },
      highlights = {},
    }
    -- vim.cmd.colorscheme "nightly"
  end,
}
