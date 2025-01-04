-- Настройка Neodev (чтобы lua-language-server понимал Neovim API)
require("neodev").setup({})

-- Настройка LSP
local lspconfig = require("lspconfig")

-- Настройка LSP для Go
lspconfig.gopls.setup {}

-- Настройка LSP для Lua
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- Используется LuaJIT (Neovim)
            },
            diagnostics = {
                globals = { "vim" }, -- Игнорировать ошибки для глобальной переменной vim
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Добавить runtime-файлы Neovim в библиотеку
                checkThirdParty = false, -- Не проверять сторонние библиотеки
            },
            telemetry = {
                enable = false, -- Отключить отправку телеметрии
            },
        },
    },
})

