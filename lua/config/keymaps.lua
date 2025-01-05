vim.keymap.set("n", "<leader>tt", function()
    local current_file_dir = vim.fn.expand("%:p:h") -- Получаем директорию текущего файла

    -- Запасной вариант: корневая директория LSP (если доступна)
    if vim.lsp and vim.lsp.get_clients then
        local clients = vim.lsp.get_clients()
        if #clients > 0 then
            for _, client in ipairs(clients) do
                if client.config and client.config.root_dir then
                    current_file_dir = client.config.root_dir
                    break
                end
            end
        end
    end

    -- Еще один запасной вариант: корневая директория Git (если доступна)
    if not current_file_dir or current_file_dir == "" then
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 then
            current_file_dir = git_root
        end
    end

    -- Последний запасной вариант: текущая рабочая директория
    if not current_file_dir or current_file_dir == "" then
        current_file_dir = vim.fn.getcwd()
    end

    -- Переход в определенную директорию и открытие терминала
    vim.cmd("lcd " .. vim.fn.fnameescape(current_file_dir))
    vim.cmd("botright 10split | terminal")
end, { noremap = true, silent = true })

