return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    tag = 'v0.9.3',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'c', 'vim', 'markdown', 'python', 'verilog' },
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })

    end,
}
