return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                on_highlights = function(hl, c)
                    -- functions
                    hl["@function"]              = { fg = c.blue }
                    hl["@function.call"]         = { fg = c.blue }
                    hl["@function.builtin"]      = { fg = c.cyan }
                    hl["@method"]                = { fg = c.blue }
                    hl["@method.call"]           = { fg = c.blue }

                    -- types & constants
                    hl["@type"]                  = { fg = c.yellow }
                    hl["@type.builtin"]          = { fg = c.cyan }
                    hl["@constant"]              = { fg = c.orange }
                    hl["@constant.builtin"]      = { fg = c.orange }

                    -- variables
                    hl["@variable"]              = { fg = c.fg }
                    hl["@variable.builtin"]      = { fg = c.red }    -- self, this
                    hl["@variable.member"]       = { fg = c.green }  -- struct fields
                    hl["@field"]                 = { fg = c.green }  -- old treesitter name
                    hl["@parameter"]             = { fg = c.orange }

                    -- keywords
                    hl["@keyword"]               = { fg = c.purple }
                    hl["@keyword.function"]      = { fg = c.purple }
                    hl["@keyword.return"]        = { fg = c.purple }
                    hl["@keyword.conditional"]   = { fg = c.purple }
                    hl["@keyword.repeat"]        = { fg = c.purple }
                    hl["@keyword.import"]        = { fg = c.purple }

                    -- misc
                    hl["@operator"]              = { fg = c.yellow }
                    hl["@decorator"]             = { fg = c.yellow }  -- python @decorator
                    hl["@attribute"]             = { fg = c.yellow }

                    -- C preprocessor
                    hl["@keyword.directive"]     = { fg = c.magenta }
                    hl["@keyword.directive.define"] = { fg = c.magenta }
                    hl["@constant.macro"]        = { fg = c.cyan }
                end,
            })
            vim.cmd.colorscheme "tokyonight"
        end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "tokyonight",
	}
    },
}
