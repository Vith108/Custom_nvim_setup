return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('trouble').setup()

        vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>')
        vim.keymap.set('n', '<leader>xb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>')
        vim.keymap.set('n', '<leader>xs', '<cmd>Trouble symbols toggle<cr>')
    end,
}
