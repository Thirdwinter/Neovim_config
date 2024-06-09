-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  return {
    "fynnfluegge/monet.nvim",
    name = "monet",
    config = function()
      require("monet").setup {

        transparent_background = false,
        semantic_tokens = true,
        dark_mode = true,
        highlight_overrides = {},
        color_overrides = {},
        styles = {
          strings = { "italic" },
          keywords = { "italic" },
          functions = { "italic" },
          variables = { "italic" },
        },
      }
    end,
  }
end
return {
  "fynnfluegge/monet.nvim",
  name = "monet",
  config = function()
    require("monet").setup {

      transparent_background = true,
      semantic_tokens = true,
      dark_mode = true,
      highlight_overrides = {},
      color_overrides = {},
      styles = {
        strings = { "italic" },
        keywords = { "italic" },
        functions = { "italic" },
        variables = { "italic" },
      },
    }
  end,
}
