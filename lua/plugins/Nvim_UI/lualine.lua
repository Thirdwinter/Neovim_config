-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- local colors = {
--   bg = "#202328",
--   fg = "#bbc2cf",
--   yellow = "#ECBE7B",
--   cyan = "#008080",
--   darkblue = "#081633",
--   green = "#98be65",
--   orange = "#FF8800",
--   violet = "#a9a1e1",
--   magenta = "#c678dd",
--   blue = "#51afef",
--   red = "#ec5f67",
-- }
-- local conditions = {
--   buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
--   hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand "%:p:h"
--     local gitdir = vim.fn.finddir(".git", filepath .. ";")
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }
--
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require "lualine"

  -- Color table for highlights
  -- stylua: ignore
  -- local colors = require "monet.palette".setup()
    local colors = {
      bg       = "#081633",
      fg       = 'fg',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
    }

    local conditions = {
      buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
      hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
      check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        -- theme = "ayu_mirage",
        -- theme = {
        --   -- We are going to use lualine_c an lualine_x as left and
        --   -- right section. Both are highlighted by c theme .  So we
        --   -- are just setting default looks o statusline
        --   normal = { c = { fg = colors.fg, bg = colors.bg } },
        --   inactive = { c = { fg = colors.fg, bg = colors.bg } },
        -- },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component) table.insert(config.sections.lualine_c, component) end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component) table.insert(config.sections.lualine_x, component) end

    -- ins_left {
    --   function() return "▊" end,
    --   color = { fg = colors.blue }, -- Sets highlighting of component
    --   padding = { left = 0, right = 0 }, -- We don't need space before this
    -- }
    ins_left {
      -- mode component
      -- function() return " " .. " 󰀘 " .. " " end,
      function() return "󰀘 " end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.blue,
          i = colors.green,
          v = colors.red,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()], bg = "bg" }
      end,
      -- padding = { left = 1 },
    }

    ins_left {
      "branch",
      icon = "",
      color = { fg = colors.violet, gui = "bold" },
    }

    ins_left {
      "filename",
      cond = conditions.buffer_not_empty,
      -- color = { fg = colors.magenta, gui = "bold" },
    }

    ins_left {
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = " ", removed = " " },
      -- diff_color = {
      --   added = { fg = colors.green },
      --   modified = { fg = colors.orange },
      --   removed = { fg = colors.red },
      -- },
      cond = conditions.hide_in_width,
    }

    -- ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

    ins_left {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      -- diagnostics_color = {
      --   color_error = { fg = colors.red },
      --   color_warn = { fg = colors.yellow },
      --   color_info = { fg = colors.cyan },
      -- },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    -- ins_left {
    --   function() return "%=" end,
    -- }

    ins_right {
      -- Lsp server name .
      "fancy_lsp_servers",
      icon = " LSP:",
      -- color = { fg = "#93aff5", gui = "bold" },
    }

    -- Add components to right sections
    ins_right {
      "o:encoding", -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      -- color = { fg = colors.green, gui = "bold" },
    }

    ins_right {
      "fileformat",
      -- fmt = string.upper,
      -- icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      -- color = { fg = colors.green, gui = "bold" },
    }

    ins_right {
      -- "location",
      "progress",
      -- color = { fg = colors.fg, gui = "bold" },
    }

    ins_right {
      "location",
    }

    ins_right {
      function() return "▊" end,
      color = { fg = colors.blue },
      padding = { left = 0 },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  -- "meuter/lualine-so-fancy.nvim",
  --     "arkav/lualine-lsp-progress",
  --     -- "WhoIsSethDaniel/lualine-lsp-progress.nvim",
  --   },
  --   opts = {
  --     options = {
  --       theme = "dracula",
  --       component_separators = { left = "", right = "" },
  --       section_separators = { left = "", right = "" },
  --       globalstatus = true,
  --       refresh = {
  --         statusline = 100,
  --       },
  --     },
  --     sections = {
  --       lualine_a = {
  --         { "fancy_mode", width = 3 },
  --       },
  --       lualine_b = {
  --         { "fancy_branch" },
  --         { "fancy_diff" },
  --       },
  --       lualine_c = {
  --         {
  --           "fancy_lsp_servers",
  --           icon = " LSP:",
  --           color = { fg = "#000000", gui = "bold" },
  --         },
  --
  --         {
  --           "lsp_progress",
  --           -- display_componentss = { "lsp_client_name", { "title", "percentage", "message" } },
  --           -- With spinner
  --           -- display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
  --           colors = {
  --             percentage = colors.cyan,
  --             title = colors.cyan,
  --             message = colors.cyan,
  --             spinner = colors.cyan,
  --             lsp_client_name = colors.magenta,
  --             use = true,
  --           },
  --           separators = {
  --             component = " ",
  --             progress = " | ",
  --             -- message = { pre = "(", post = ")" },
  --             percentage = { pre = "", post = "%% " },
  --             title = { pre = "", post = ": " },
  --             lsp_client_name = { pre = "[", post = "]" },
  --             spinner = { pre = "", post = "" },
  --             message = { pre = "(", post = ")", commenced = "In Progress", completed = "Completed" },
  --           },
  --           display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
  --           timer = { progress_enddelay = 500, spinner = 1000 },
  --           spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
  --         },
  --       },
  --       lualine_x = {
  --         { "fancy_macro" },
  --         { "fancy_diagnostics" },
  --         { "fancy_searchcount" },
  --         { "fancy_location" },
  --       },
  --       lualine_y = {
  --         { "fancy_filetype" },
  --       },
  --       lualine_z = {
  --         {
  --           "filename",
  --           cond = conditions.buffer_not_empty,
  --           color = { fg = colors.darkblue, gui = "bold" },
  --         },
  --         {
  --           "o:encoding", -- option component same as &encoding in viml
  --           fmt = string.upper, -- I'm not sure why it's upper case either ;)
  --           cond = conditions.hide_in_width,
  --           color = { fg = colors.darkblue, gui = "bold" },
  --         },
  --         {
  --           "fileformat",
  --         },
  -- },
  -- },
  -- },
  -- },
}
