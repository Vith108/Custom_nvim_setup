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

if vim.opt.diff:get() then
    vim.cmd.colorscheme("tokyonight")
    vim.opt.fillchars:append("diff:/")
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2d1a3d", fg = "#cc88ff" })
    vim.api.nvim_set_hl(0, "DiffText",   { bg = "#4d2d6e", fg = "#e0aaff", bold = true })
end
require("utils.search_parents")
require("claude-code").setup({
    -- Terminal window settings
    window = {
        split_ratio = 0.3,  -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
        position = "botright", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
        enter_insert = true, -- Whether to enter insert mode when opening Claude Code
        hide_numbers = true, -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window

        -- Floating window configuration (only applies when position = "float")
        float = {
            width = "80%", -- Width: number of columns or percentage string
            height = "80%", -- Height: number of rows or percentage string
            row = "center", -- Row position: number, "center", or percentage string
            col = "center", -- Column position: number, "center", or percentage string
            relative = "editor", -- Relative to: "editor" or "cursor"
            border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
        },
    },
    -- File refresh settings
    refresh = {
        enable = true,         -- Enable file change detection
        updatetime = 100,      -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000, -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
    },
    -- Git project settings
    git = {
        use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
    },
    -- Shell-specific settings
    shell = {
        separator = '&&', -- Command separator used in shell commands
        pushd_cmd = 'pushd', -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
        popd_cmd = 'popd', -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
    },
    -- Command settings
    command = "claude", -- Command used to launch Claude Code
    -- Command variants
    command_variants = {
        -- Conversation management
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume", -- Display an interactive conversation picker

        -- Output options
        verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
    },
    -- Keymaps
    keymaps = {
        toggle = {
            normal = "<C-,>",    -- Normal mode keymap for toggling Claude Code, false to disable
            terminal = "<C-,>",  -- Terminal mode keymap for toggling Claude Code, false to disable
            variants = {
                continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
                verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
            },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true,     -- Enable scrolling keymaps (<C-f/b>) for page up/down
    }
})
