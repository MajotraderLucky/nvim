-- Настройка Neodev (чтобы lua-language-server понимал Neovim API)
require("neodev").setup({
    library = {
        enabled = true, -- Включить поддержку библиотек
        runtime = true, -- Добавить Neovim runtime файлы в библиотеку
        types = true,   -- Добавить типы (для подсказок в LSP)
        plugins = { "nvim-tree", "telescope.nvim" }, -- Указать библиотеки для определенных плагинов
    },
    setup_jsonls = true, -- Включить поддержку jsonls (если используете)
    override = function(_, options)
        -- Вы можете переопределить настройки для конкретных проектов
        options.settings.Lua.workspace.checkThirdParty = false
    end,
})

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

