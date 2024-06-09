-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
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
