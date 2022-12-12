local M = {}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require("telescope.config").values
local themes = require('telescope.themes')
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

function M.setup(opts)
    M.selected_dirs = opts['selected_dirs']
end

function M.hupoon()
    local opts = opts or {}
    pickers.new(opts, {
        prompt_title = "hupoon",
        hidden = false,
        no_ignore = true,
        no_ignore_parent = true,

        finder = finders.new_table {
            results = M.selected_dirs
        },

        sorter = conf.generic_sorter(opts),

        layout_config = {
            width = 0.5
        },

        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)

                local selection = action_state.get_selected_entry()
                require('telescope').extensions.file_browser.file_browser{
                    path = selection[1],
                    cwd_to_path = true,
                    -- make a way to open a terminal
                    -- if the selection is a valid directory
                    --vim.api.nvim_create_buf(listed, scratch)
                    --vim.api.nvim_open_win()
                    --vim.api.nvim_open_term()
                }
            end)
            return true
        end,
    }):find(themes.get_dropdown())
end


function M.find_home()
    require('telescope.builtin').find_files {
        cwd = '~/',
        hidden = false,
        no_ignore = true,
        no_ignore_parent = true,
    }
end


function M.find_here()
    require('telescope.builtin').find_files {
        cwd = '.',
        hidden = false,
        no_ignore = true,
        no_ignore_parent = true,
    }
end


function M.browse_proj()
    require('telescope').extensions.file_browser.file_browser{}
end


function M.search_buffer()
    require("telescope.builtin").current_buffer_fuzzy_find()
end


require('telescope').load_extension('file_browser')

return M
