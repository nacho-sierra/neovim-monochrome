local options = require("rose-pine.config").options

-- Helper function to blend two hex colors
-- This creates grayscale values by blending black and white
local function blend(black, white, alpha)
	-- alpha: 0 = full black, 1 = full white
	local function hex_to_rgb(hex)
		hex = hex:gsub("#", "")
		return {
			tonumber(hex:sub(1, 2), 16),
			tonumber(hex:sub(3, 4), 16),
			tonumber(hex:sub(5, 6), 16),
		}
	end

	local function rgb_to_hex(r, g, b)
		return string.format("#%02X%02X%02X", r, g, b)
	end

	local black_rgb = hex_to_rgb(black)
	local white_rgb = hex_to_rgb(white)

	local r = math.floor(black_rgb[1] * (1 - alpha) + white_rgb[1] * alpha)
	local g = math.floor(black_rgb[2] * (1 - alpha) + white_rgb[2] * alpha)
	local b = math.floor(black_rgb[3] * (1 - alpha) + white_rgb[3] * alpha)

	return rgb_to_hex(r, g, b)
end

-- Generate monochrome palette
local function generate_monochrome_palette()
	local black = options.monochrome_black or "#1a1a1a"
	local white = options.monochrome_white or "#e8e8e8"

	return {
		-- Background shades (darkest to lighter)
		_nc = blend(black, white, 0.00), -- same as base
		base = blend(black, white, 0.00),
		surface = blend(black, white, 0.08),
		overlay = blend(black, white, 0.15),

		-- Text shades (lightest to dimmer)
		text = blend(black, white, 0.95),
		subtle = blend(black, white, 0.60),
		muted = blend(black, white, 0.45),

		-- Highlight shades (blended between black and white)
		highlight_low = blend(black, white, 0.10),
		highlight_med = blend(black, white, 0.25),
		highlight_high = blend(black, white, 0.40),

		-- Semantic colors (all grayscale in monochrome mode)
		-- Using subtle variations to maintain semantic distinction
		love = blend(black, white, 0.70),  -- slightly brighter (was pink/red)
		gold = blend(black, white, 0.75),  -- bright (was yellow/gold)
		rose = blend(black, white, 0.72),  -- medium-bright (was rose)
		pine = blend(black, white, 0.55),  -- medium (was teal/blue)
		foam = blend(black, white, 0.65),  -- medium-light (was cyan)
		iris = blend(black, white, 0.68),  -- medium-bright (was purple)
		leaf = blend(black, white, 0.58),  -- medium (was green)

		none = "NONE",
	}
end

-- Original Rose Pine variants (kept for reference/non-monochrome mode)
local variants = {
	main = {
		_nc = "#16141f",
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
		none = "NONE",
	},
	moon = {
		_nc = "#1f1d30",
		base = "#232136",
		surface = "#2a273f",
		overlay = "#393552",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		leaf = "#95b1ac",
		highlight_low = "#2a283e",
		highlight_med = "#44415a",
		highlight_high = "#56526e",
		none = "NONE",
	},
	dawn = {
		_nc = "#f8f0e7",
		base = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		subtle = "#797593",
		text = "#464261",
		love = "#b4637a",
		gold = "#ea9d34",
		rose = "#d7827e",
		pine = "#286983",
		foam = "#56949f",
		iris = "#907aa9",
		leaf = "#6d8f89",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
		none = "NONE",
	},
}

-- Handle variant specific overrides from user config
if options.palette ~= nil and next(options.palette) then
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

-- Return monochrome palette if enabled, otherwise return variant
if options.monochrome then
	return generate_monochrome_palette()
end

-- Original variant selection logic
if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.dawn or variants[options.dark_variant or "main"]
