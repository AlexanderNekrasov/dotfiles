local function check_competitive()
    local line = vim.api.nvim_get_current_line()
    return line == "#include \"quark/template/template.hpp\"" or line == "#define PRAGMAS" or line == "// USE_MESON"
end

if check_competitive() then
    vim.api.nvim_set_keymap('n', '<Leader>cc',
        ':w<CR>:!meson compile -C build<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>cp', ':w<CR>:!CXX=/opt/homebrew/bin/g++-13 oj-bundle -I /Users/alex/Templates % | pbcopy<CR><CR>', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>cc',
    --     ':w<CR>:!CXX=/opt/homebrew/bin/g++-13 oj-bundle -I /Users/alex/Templates % > %:r.bundled.cpp && g++ -std=c++20 -Wall -Wextra -DLOCAL -g -o %:r %:r.bundled.cpp<CR>'
    --     , {})
else
    vim.api.nvim_set_keymap('n', '<Leader>cc', ':w<CR>:!g++ -std=c++20 -Wall -Wextra -DLOCAL -g -o %:r %<CR>', {})
    vim.api.nvim_set_keymap('n', '<Leader>cg',
        ':w<CR>:!g++ -std=c++20 -Wall -Wextra -DLOCAL -fsanitize=address,bounds,undefined -g -o %:r %<CR>', {})
end
-- vim.keymap.set('n', '<Leader>q', check_competitive, {})

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
