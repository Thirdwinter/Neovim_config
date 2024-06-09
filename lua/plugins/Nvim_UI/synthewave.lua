if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require "fluoromachine"

      fm.setup {
        glow = false,
        -- theme = "fluoromachine",
        -- theme = "delta",
        theme = "retrowave",
        brightness = 0.00,
        -- transparent = "full",
        overrides = {
          ["@type"] = { italic = false, bold = false },
          ["@function"] = { italic = true, bold = false },
          ["@comment"] = { italic = true, bold = false },
          ["@keyword"] = { italic = true, bold = false },
          ["@constant"] = { italic = true, bold = false },
          ["@variable"] = { italic = true, bold = false },
          ["@field"] = { italic = true, bold = false },
          ["@parameter"] = { italic = false, bold = false },
        },
        colors = function(_, d)
          return {
            bg = "#190920",
            alt_bg = d("#190920", 20),
            cyan = "#49eaff",
            red = "#FF8F5A",
            yellow = "#5AFF3D",
            orange = "#8892D8",
            pink = "#ffadff",
            purple = "#9544f7",
          }
        end,
      }

      -- vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
