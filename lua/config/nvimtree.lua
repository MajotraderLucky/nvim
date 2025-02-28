local api = require("nvim-tree.api")

-- Функция для открытия узла и центрирования его в дереве
local function open_and_center()
    local node = api.tree.get_node_under_cursor() -- Получаем текущий узел
    if node then
        api.node.open.edit()  -- Открываем файл/директорию
        vim.cmd("normal! zz") -- Центрируем окно
    end
end

-- Назначаем кастомное поведение клавише <CR> (Enter)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.keymap.set("n", "<CR>", open_and_center, { buffer = true, noremap = true, silent = true })
    end,
})

