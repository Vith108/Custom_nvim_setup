require("config.options")
require("config.keybinds")
require("config.lazy")

--Initalising legacy and search-parent
vim.cmd.source("~/.config/nvim/lua/utils/legacy.vim")

vim.cmd([[
:nnoremap <leader>w :SFiles "<C-R><C-W>"<CR>
:nnoremap <leader>W :SFiles "<C-R><C-A>"<CR>
:nnoremap <leader>bw :SBuffers "<C-R><C-W>"<CR>
:nnoremap <leader>Bw :SBuffers "<C-R><C-A>"<CR>
:nnoremap <leader>n :let @+=expand("%:p").":".line('.').":\t".getline(".")<CR>
:nnoremap ,f :let @+ = expand("%:t")<CR>
:nnoremap ,F :let @+ = expand("%:p")<CR>
:nnoremap ,w :let @+ = "<C-R><C-W>"<CR>
:nnoremap ,W :let @+ = "<C-R><C-A>"<CR>
]])

vim.opt.hlsearch = true
vim.o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "setlocal equalprg=yapf",
})

require("utils.search_parents")
