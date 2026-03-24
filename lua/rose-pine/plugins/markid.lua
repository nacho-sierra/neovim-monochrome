--- Monochrome for markid
--- https://github.com/David-Kunz/markid
---
--- @usage
--- local highlights = require("rose-pine.plugins.markid")
--- require("nvim-treesitter.configs").setup({ markid = { enable = true, colors = highlights } })

local p = require("rose-pine.palette")

-- Return three different grayscale shades for markid
-- In monochrome mode, these are all grayscale variations
return { p.foam, p.rose, p.iris }
