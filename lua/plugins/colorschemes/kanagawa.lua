return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    config = function()
        require('kanagawa').setup({
            transparent = true,
            theme = "wave",
            overrides = function(colors)
                local theme = colors.theme
                return {
                    Normal = { fg = theme.ui.fg_dim, bg = "none" },
                    ["@variable"] = { fg = theme.syn.identifier },
                    ["@function"] = { fg = theme.syn.fun, bold = true },
                    ["@keyword"] = { fg = theme.syn.keyword, italic = true },
                    ["@string"] = { fg = theme.syn.string },
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none", fg = theme.ui.fg_dim },
                    Comment = { fg = theme.syn.comment, italic = true },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa")
    end
}
