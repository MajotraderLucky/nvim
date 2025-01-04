vim.keymap.set("n", "<leader>tt", function()
    local root_dir = nil

    -- Проверяем, доступен ли модуль LSP
    if vim.lsp and vim.lsp.get_clients then
        local clients = vim.lsp.get_clients()
        if #clients > 0 then
            for _, client in ipairs(clients) do
                if client.config and client.config.root_dir then
                    root_dir = client.config.root_dir
                    break
                end
            end
        end
    end

    -- Если LSP не дал корневую директорию, используем Git
    if not root_dir or root_dir == "" then
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 then
            root_dir = git_root
        end
    end

    -- Если ни LSP, ни Git не нашли директорию, используем текущую директорию
    if not root_dir or root_dir == "" then
        root_dir = vim.fn.getcwd()
    end

    -- Переходим в корневую директорию и открываем терминал
    vim.cmd("lcd " .. root_dir)
    vim.cmd("botright 10split | terminal")
end, { noremap = true, silent = true })

