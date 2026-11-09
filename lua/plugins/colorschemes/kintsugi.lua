return {
  "metalelf0/kintsugi-nvim",
  name = "kintsugi",
  lazy = false,
  priority = 1000,
  config = function()
    require("kintsugi").setup({
        transparent = true,
        terminal_colors = true,
        bold_keywords = true,
        italic_comments = false,
        })
    vim.cmd("colorscheme kintsugi-flared")

    -- Add this inside the config so it applies right after the theme
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
