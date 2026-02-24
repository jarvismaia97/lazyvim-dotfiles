-- Mini.surround: surround text with brackets, quotes, tags
-- Usage: sa" (add), sd" (delete), sr"' (replace " with ')

return {
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "sa",            -- sa{motion}{char}  e.g. saiw" = surround word with "
        delete = "sd",         -- sd{char}          e.g. sd" = delete surrounding "
        replace = "sr",        -- sr{old}{new}      e.g. sr"' = replace " with '
        find = "sf",           -- Find surrounding
        find_left = "sF",      -- Find surrounding (left)
        highlight = "sh",      -- Highlight surrounding
        update_n_lines = "sn", -- Update n_lines
      },
    },
  },
}
