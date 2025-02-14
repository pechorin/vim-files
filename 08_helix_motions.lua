local Utils = require('AniMotion.utils')

require("AniMotion").setup({
  mode = "helix", -- "nvim" or "animotion"
  word_keys = {
    [Utils.Targets.NextWordStart] = "w",
    [Utils.Targets.NextWordEnd] = "e",
    [Utils.Targets.PrevWordStart] = "b",
    [Utils.Targets.NextLongWordStart] = "W",
    [Utils.Targets.NextLongWordEnd] = "E",
    [Utils.Targets.PrevLongWordStart] = "B",
  }, -- you can get the targets by local Utils = require("Animotion.Utils")
  edit_keys = { "c", "d", "s", "r", "y" }, -- you can add "p" if you want.
  clear_keys = { "<Esc>" }, -- used when you want to deselect/exit from SEL mode.
  marks = {"y", "z"}, -- Is a mark used internally in this plugin, when we do a visual select when changing or deleting the highlighted word.
  map_visual = true, -- When true, we capture "v" and pressing it will enter visual mode with the plugin selection as part of the visual selection. When false, pressing "v" will exit SEL mode and the selection will be lost. You want to set to false if you have trouble with other mappings associated to "v". I recommend to try in true first.
  -- color = { bg = "#673AB7" } -- put color = "Visual" to use the default visual mode color.
  color = 'Visual' -- put color = "Visual" to use the default visual mode color.
})

