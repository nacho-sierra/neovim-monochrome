local p = require("rose-pine.palette")
local config = require("rose-pine.config")

local bg_base = p.base
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.surface, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = p.surface, fg = p.muted, gui = "italic" },
	},
	insert = {
		a = { bg = p.surface, fg = p.text, gui = "bold" },
	},
	visual = {
		a = { bg = p.surface, fg = p.text, gui = "bold" },
	},
	replace = {
		a = { bg = p.surface, fg = p.text, gui = "bold" },
	},
	command = {
		a = { bg = p.surface, fg = p.text, gui = "bold" },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted, gui = "italic" },
	},
}
