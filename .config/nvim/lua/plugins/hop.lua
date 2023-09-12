return {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
        local hop = require('hop')
        hop.setup()
        local directions = require('hop.hint').HintDirection
        vim.keymap.set('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, {remap=true})
        vim.keymap.set('', 'F', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, {remap=true})
        vim.keymap.set('', 't', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, {remap=true})
        vim.keymap.set('', 'T', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, {remap=true})

        vim.keymap.set('', '<Leader>f', function()
            hop.hint_words()
        end, {remap=true})
        vim.keymap.set('', '<Leader>F', function()
            hop.hint_words({multi_windows = true})
        end, {remap=true})
    end
}
