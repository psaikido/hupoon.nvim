# hupoon

A navigation utility that allows for user selected directories to be browsed and searched system wide.  
After 'harpoon' (https://github.com/ThePrimeagen/harpoon) 


## setup
Packer  
`use {'psaikido/hupoon.nvim'}`

init.lua:  

```lua
require('hupoon').setup({  
    selected_dirs = {  
        '~/.config',  
        '~/bin',  
        '~/code',  
    }
})
```

## command
`:Hupoon`

## suggested keymaps
```lua
local hupoon = require("hupoon")  
vim.keymap.set('n', '<leader>h', hupoon.hupoon, {desc = "hupoon"})  
vim.keymap.set('n', '<leader>hh', hupoon.find_home, {desc = "Home Find"})  
vim.keymap.set('n', '<leader>hf', hupoon.find_here, {desc = "Here Find"})  
vim.keymap.set('n', '<leader>hp', hupoon.browse_proj, {desc = "Browse Project"})  
vim.keymap.set('n', '<leader>hb', hupoon.search_buffer, {desc = "Search Buffer"})
```  
