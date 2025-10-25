require("config.options")
require("config.keybinds")
require("config.lazy")
--Initalising legacy and search-parent
local legacy_file = "/lua/utils/legacy.vim"
local config_path = "~/.config/nvim"
local config_folder = os.getenv("NVIM_APPNAME")
if config_folder then
	config_path = "~/.config/" .. config_folder
end
vim.cmd.source(config_path .. legacy_file)

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
