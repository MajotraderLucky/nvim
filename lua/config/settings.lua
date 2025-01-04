-- Общие настройки Neovim
vim.opt.number = true        -- Нумерация строк
vim.opt.relativenumber = true -- Относительные номера
vim.opt.termguicolors = true -- Цвета терминала
vim.opt.background = "dark"  -- Тёмная тема
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,localoptions"

-- Отключение провайдеров, которые не используются
vim.g.loaded_node_provider = 1  -- Node.js
vim.g.loaded_perl_provider = 0  -- Perl
vim.g.loaded_ruby_provider = 0  -- Ruby
