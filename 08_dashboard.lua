local alpha_start_dashboard = {
  title = 'Hello world!',
  buttons = {
    {"e", " > New File", "<cmd>ene<CR>"},
    {"n", " > Toggle file explorer", "<cmd>Neotree<CR>"},
    {"f", " > Find File", "<cmd>Telescope find_files<CR>"},
    {"F", " > Find Word", "<cmd>Telescope live_grep<CR>"},
    {"m", " > Keymaps", "<cmd>Telescope keymaps<CR>"},
    {"g", " > Git status", "<cmd>Git<CR>"},
    {"u", " > Update plugins", "<cmd>PlugUpdate<CR>"},
    {"H", " > Edit .vimrc", "<cmd>e ~/.vimrc<CR>"},
    {"c", " > Change colorscheme", "<cmd>Telescope themes<CR>"},
  }
}

local alpha = require("alpha")
local startify = require("alpha.themes.startify")

local title = alpha_start_dashboard.title or 'Hello world'

startify.section.header.val = { title }

startify.opts.layout[1].val = 2
startify.opts.opts.margin   = 3

-- disable MRU
startify.section.mru.val = { { type = "padding", val = 0 } }

local buttons = {}

for _, data in pairs(alpha_start_dashboard.buttons or {}) do
  local btn = startify.button(unpack(data))
  table.insert(buttons, btn)
end

startify.section.top_buttons.val = buttons

-- Send config to alpha
alpha.setup(startify.config)
