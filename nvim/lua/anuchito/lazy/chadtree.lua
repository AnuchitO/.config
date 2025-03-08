return {
  {
    "ms-jpq/chadtree",
    branch = "chad",  -- Use the correct branch
    build = "python3 -m chadtree deps",  -- Install dependencies
    cmd = { "CHADopen" },  -- Lazy load on CHADTree open
    config = function()
      vim.g.chadtree_settings = {
        keymap = {
          primary = { "<Enter>" },   -- Open file
          secondary = { "o" },       -- Alternative open
          tertiary = { "<Tab>" },    -- Expand directory
        },
        theme = {
          icon_glyph_set = "devicons",
        },
        view = {
          width = 30,
        },
      }
    end,
  },
}
