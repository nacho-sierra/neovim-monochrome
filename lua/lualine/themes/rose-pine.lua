local p = require("rose-pine.palette")
local config = require("rose-pine.config")

local bg_base = p.surface
if config.options.styles.transparency then
	bg_base = "NONE"
end

-- All modes use the same monochrome color scheme
-- The visual distinction comes from text styling (bold/italic)
-- rather than color differences in monochrome mode

return {
	normal = {
		a = { bg = p.overlay, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = bg_base, fg = p.muted },
	},
	insert = {
		a = { bg = p.overlay, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = bg_base, fg = p.muted },
	},
	visual = {
		a = { bg = p.overlay, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = bg_base, fg = p.muted },
	},
	replace = {
		a = { bg = p.overlay, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = bg_base, fg = p.muted },
	},
	command = {
		a = { bg = p.overlay, fg = p.text, gui = "bold" },
		b = { bg = p.surface, fg = p.subtle },
		c = { bg = bg_base, fg = p.muted },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted },
	},
}
