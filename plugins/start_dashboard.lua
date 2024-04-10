-- Dashboard
local alpha = require("alpha")
local startify = require("alpha.themes.startify")

startify.section.header.val = {
    -- [[     ]],
    [[> Welcome!   ]],
    -- [[     ]],
}

startify.opts.layout[1].val = 2
startify.opts.opts.margin = 3

-- disable MRU
startify.section.mru.val = { { type = "padding", val = 0 } }

local alpha_time = tostring(os.date("%A %I:%M %p"))

-- Set menu
startify.section.top_buttons.val = {
    startify.button("e", " > New File", "<cmd>ene<CR>"),
    startify.button("n", " > Toggle file explorer", "<cmd>Neotree<CR>"),
    startify.button("f", " > Find File", "<cmd>Telescope find_files<CR>"),
    startify.button("F", " > Find Word", "<cmd>Telescope live_grep<CR>"),
    startify.button("m", " > Keymappings", "<cmd>Telescope keymaps<CR>"),
    startify.button("g", " > Git status", "<cmd>Git<CR>"),
    startify.button("u", " > Update plugins", "<cmd>PlugUpdate<CR>"),
    startify.button("H", " > Edit .vimrc", "<cmd>e ~/.vimrc<CR>"),
    startify.button("c", " > Change colorscheme", "<cmd>Telescope themes<CR>"),
    -- startify.button("SPC wr", " > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
}

-- Send config to alpha
alpha.setup(startify.config)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
