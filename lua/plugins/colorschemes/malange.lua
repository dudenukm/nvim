return {
  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- 1. Create an autocommand to modify highlights whenever Melange loads
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "melange",
        callback = function()
          -- --- TRANSPARENCY SETUP ---
          local transparent_groups = {
            "Normal",
            "NormalFloat",
            "NormalNC",
            "SignColumn",
            "LineNr",
            "CursorLineNr",
            "FoldColumn",
            "StatusLine",
            "StatusLineNC",
            "EndOfBuffer",
          }
          for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
          end

          -- --- STRIP ALL ITALICS ---
          -- Get all defined highlight groups
          local highlights = vim.api.nvim_get_hl(0, {})
          for group_name, hl_data in pairs(highlights) do
            -- If the group uses italics, turn it off
            if hl_data.italic then
              hl_data.italic = false
              vim.api.nvim_set_hl(0, group_name, hl_data)
            end
          end
        end,
      })

      -- 2. Load the colorscheme (triggers the autocommand above)
      vim.cmd("colorscheme melange")
    end,
  },
}
