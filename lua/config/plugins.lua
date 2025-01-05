return {
    -- Плагин для управления сессиями
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_save = true, -- Включить автоматическое сохранение
                auto_restore = true, -- Включить автоматическое восстановление
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

    -- Добавляем mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "pylsp" }, -- Здесь перечисляем необходимые LSP-серверы
                automatic_installation = true, -- Включить автоматическую установку серверов
            })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "go", "markdown" }, -- Добавить языки
                highlight = { enable = true }, -- Включить подсветку
                sync_install = false, -- Не синхронизировать языки автоматически
                auto_install = true, -- Автоматическая установка при открытии файла
		ignore_install = {},
		modules= {},
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
                update_focused_file = { -- Добавлена настройка обновления текущего файла
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
            vim.opt.termguicolors = true -- Включить поддержку TrueColor
            vim.opt.background = "dark"  -- Тёмная тема
            vim.cmd("colorscheme omni")  -- Установить тему Omni

            -- Настройка яркой подсветки парных скобок
            vim.cmd([[
                highlight MatchParen guifg=#000000 guibg=#FFD700 gui=bold,underline
            ]])
        end,
    },

    -- Добавление парной скобки
    {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end,
    },
}
