<p align="center">
    <img src="https://assets.uami.ai/uami/assets/logo-white.png" width="80" />
    <h2 align="center">Monochrome for Neovim</h2>
</p>

A 100% monochromatic colorscheme for Neovim. Only two colors: an off-black and an off-white. No blues, no reds, no greens—just grayscale.

## Getting started

Install using your favourite package manager:

### [lazy.nvim](https://lazy.folke.io/installation)

```lua
return {
    "nacho-sierra/neovim-monochrome",
    name = "monochrome",
    config = function()
        require("rose-pine").setup({
            monochrome_black = "#151515",
            monochrome_white = "#f0f0f0",
        })
        vim.cmd("colorscheme monochrome")
    end
}
```

## Options

> [!IMPORTANT]
> Configure options _before_ setting colorscheme.

```lua
require("rose-pine").setup({
    -- Enable monochrome mode (default: true)
    monochrome = true,
    
    -- Customize the two colors (hex format)
    monochrome_black = "#1a1a1a",  -- Off-black
    monochrome_white = "#e8e8e8",  -- Off-white
    
    -- Other options
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
})

vim.cmd("colorscheme monochrome")
```

### How It Works

When `monochrome = true`:
- **All colors** are derived from just two base colors
- The palette generates grayscale shades by blending your off-black and off-white
- Semantic colors (errors, warnings, git changes, etc.) use different grayscale intensities
- Visual distinction comes from styling (bold, italic, underline) rather than hue

## Contributing

Contributions welcome. Create an issue or start a discussion for proposed changes.

Feel free to update the wiki with any configurations or recipes.
