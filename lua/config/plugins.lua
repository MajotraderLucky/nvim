return {
    -- Плагин для управления сессиями
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_save = true,
                auto_restore = true,
                suppressed_dirs = { "~/", "~/Downloads", "/" },
            })
        end,
    },

    -- Менеджер сессий
    {
        "olimorris/persisted.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted")
        end,
    },

    -- Поддержка Neovim API для lua
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({})
        end,
    },

    -- LSP
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "pylsp" },
                automatic_installation = true,
            })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "go", "markdown" },
                highlight = { enable = true },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
            })
        end,
    },

    -- Nvim Tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                renderer = {
                    icons = {
                        show = {
                            git = true,
                            file = true,
                            folder = true,
                            folder_arrow = true,
                        },
                    },
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 400,
                },
                view = {
                    width = 30,
                    side = "left",
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
            })
        end,
    },

    -- Omni тема
    {
        "yonlu/omni.vim",
        config = function()
            vim.opt.termguicolors = true
            vim.opt.background = "dark"
            vim.cmd("colorscheme omni")
            vim.cmd([[
                highlight MatchParen guifg=#000000 guibg=#FFD700 gui=bold,underline
            ]])
        end,
    },

    -- Автозакрытие скобок
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    -- Управление буферами с помощью lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_separators = "",
                    component_separators = "",
                    always_divide_middle = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        "filename",
                        {
                            function()
                                -- Индикатор раскладки через xkb-switch
                                local handle = io.popen("xkb-switch")
                                if handle then
                                    local layout = handle:read("*a") or ""
                                    handle:close()
                                    layout = layout:gsub("%s+", "")
                                    if layout == "" then
                                        layout = "?"
                                    end
                                    return "⌨️ " .. layout
                                end
                                return "⌨️ ?"
                            end,
                            icon = "",
                        },
                    },
                    lualine_x = { "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                tabline = {
                    lualine_a = { "buffers" },
                    lualine_b = { "tabs" },
                },
                extensions = { "nvim-tree" },
            })
        end,
    },

    -- Представление буферов в виде вкладок
    {
        "romgrk/barbar.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                animation = true,
                auto_hide = false,
                clickable = true,
                icons = {
                    filetype = { enabled = true },
                    separator = { left = "▎", right = "" },
                    modified = { button = "●" },
                    pinned = { button = "📌" },
                },
                maximum_padding = 2,
                maximum_length = 30,
                tabpages = true,
                semantic_letters = true,
            })
        end,
    },
}

