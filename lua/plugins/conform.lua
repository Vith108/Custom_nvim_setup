return {
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                python = { 'yapf' },
                c      = { 'clang_format' },
            },
        })

        -- <F3> formats via conform (falls back to LSP if no formatter configured)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function()
            require('conform').format({ lsp_fallback = true, async = true })
        end)
    end,
}
