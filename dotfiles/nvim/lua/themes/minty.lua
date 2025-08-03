-- Minty theme for nvchad base46
local M = {}

M.base_30 = {
	white = "#edeeeb",
	darker_black = "#000000",
	black = "#010202", -- nvim bg
	black2 = "#0a0a0a",
	one_bg = "#151515",
	one_bg2 = "#1f1f1f",
	one_bg3 = "#2a2a2a",
	grey = "#404040",
	grey_fg = "#4a4a4a",
	grey_fg2 = "#545454",
	light_grey = "#808080",
	red = "#FF557F",
	baby_pink = "#ff6090",
	pink = "#d70087",
	line = "#303030", -- for lines like vertsplit
	green = "#87ffaf",
	vibrant_green = "#9fffbf",
	nord_blue = "#7b9ccd",
	blue = "#5fd7ff",
	seablue = "#5de3e0",
	yellow = "#f6eb53",
	sun = "#ffe763",
	purple = "#ffd7ff",
	dark_purple = "#e7b0e7",
	teal = "#5de3e0",
	orange = "#ff8700",
	cyan = "#5fd7ff",
	statusline_bg = "#0a0a0a",
	lightbg = "#303030",
	pmenu_bg = "#5fd7ff",
	folder_bg = "#5de3e0",
}

M.base_16 = {
	base00 = "#010202", -- Default Background
	base01 = "#0a0a0a", -- Lighter Background (Used for status bars, line number and folding marks)
	base02 = "#303030", -- Selection Background
	base03 = "#404040", -- Comments, Invisibles, Line Highlighting
	base04 = "#585858", -- Dark Foreground (Used for status bars)
	base05 = "#d0d0d0", -- Default Foreground, Caret, Delimiters, Operators
	base06 = "#e0e0e0", -- Light Foreground (Not often used)
	base07 = "#edeeeb", -- Light Background (Not often used)
	base08 = "#FFFFFF", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	base09 = "#5de3e0", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
	base0A = "#ff557f", -- Classes, Markup Bold, Search Text Background
	base0B = "#87ffaf", -- Strings, Inherited Class, Markup Code, Diff Inserted
	base0C = "#5de3e0", -- Support, Regular Expressions, Escape Characters, Markup Quotes
	base0D = "#ff8700", -- Functions, Methods, Attribute IDs, Headings
	base0E = "#FF557F", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
	base0F = "#5fd7ff", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

M.polish_hl = { treesitter = {
	["@boolean"] = { fg = M.base_30.cyan, bold = true },
} }
M.polish_hl = {
	treesitter = {
		["@variable.builtin"] = { fg = M.base_30.orange, italic = true },
		["@constant"] = { fg = M.base_30.cyan, bold = true },
		["@constant.builtin"] = { fg = M.base_30.cyan, bold = true },
		["@module.builtin"] = { fg = M.base_30.orange, bold = true },
		["@string.special.url"] = { fg = M.base_30.cyan, underline = true },
		["@boolean"] = { fg = M.base_30.cyan, bold = true },
		["@type.builtin"] = { fg = M.base_30.cyan, bold = true },
		["@attribute.builtin"] = { fg = M.base_30.cyan, bold = true },
		["@function"] = { fg = M.base_30.orange, bold = true },
		["@function.builtin"] = { fg = M.base_30.orange, bold = true },
		["@keyword"] = { fg = M.base_30.red, bold = true },
		["@keyword.coroutine"] = { fg = M.base_30.red, bold = true },
		["@keyword.function"] = { fg = M.base_30.red, bold = true },
		["@keyword.repeat"] = { fg = M.base_30.red, bold = true },
		["@keyword.return"] = { fg = M.base_30.red, bold = true },
		["@keyword.exception"] = { fg = M.base_30.red, bold = true },
		["@keyword.conditional"] = { fg = M.base_30.red, bold = true },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "minty")

return M
