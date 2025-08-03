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
	red = "#FF407E",
	baby_pink = "#FF7D9E",
	pink = "#ffaaff",
	line = "#303030", -- for lines like vertsplit
	green = "#64ffac",
	vibrant_green = "#9fffbf",
	nord_blue = "#19FFFF",
	blue = "#87FFFF",
	seablue = "#5de3e0",
	yellow = "#f6eb53",
	sun = "#ffe763",
	purple = "#ffd7ff",
	dark_purple = "#e7b0e7",
	teal = "#5de3e0",
	orange = "#FF8702",
	cyan = "#19FFFF",
	statusline_bg = "#0a0a0a",
	lightbg = "#303030",
	pmenu_bg = "#5fd7ff",
	folder_bg = "#5de3e0",
}

M.base_16 = {
	base00 = "#010202", -- Default Background
	base01 = "#0a0a0a", -- Lighter Background (Used for status bars, line number and folding marks)
	base02 = "#303030", -- Selection Background
	base03 = "#808080", -- Comments, Invisibles, Line Highlighting
	base04 = "#585858", -- Dark Foreground (Used for status bars)
	base05 = "#d0d0d0", -- Default Foreground, Caret, Delimiters, Operators
	base06 = "#e0e0e0", -- Light Foreground (Not often used)
	base07 = "#edeeeb", -- Light Background (Not often used)
	base08 = "#FFFFFF", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	base09 = "#19FFFF", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
	base0A = "#FF557F", -- Classes, Markup Bold, Search Text Background
	base0B = "#9FFFBF", -- Strings, Inherited Class, Markup Code, Diff Inserted
	base0C = "#87FFFF", -- Support, Regular Expressions, Escape Characters, Markup Quotes
	base0D = "#FF8702", -- Functions, Methods, Attribute IDs, Headings
	base0E = "#FF407E", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
	base0F = "#5de3e0", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

M.polish_hl = {
	treesitter = {
		--		["@variable.builtin"] = { fg = M.base_30.orange, italic = true },
		--		["@variable.parameter"] = { fg = M.base_30.orange },
		--
		["@constant"] = { fg = M.base_30.cyan, bold = true },
		["@constant.builtin"] = { fg = M.base_30.cyan, bold = true },
		["@constant.macro"] = { fg = M.base_30.cyan },
		--
		["@module"] = { fg = M.base_30.orange },
		["@module.builtin"] = { fg = M.base_30.orange, bold = true },
		--
		--		["@label"] = { fg = M.base_30.red },
		--
		["@string"] = { fg = M.base_30.green },
		["@string.regex"] = { fg = M.base_30.green },
		["@string.escape"] = { fg = M.base_30.cyan },
		["@string.special"] = { fg = M.base_30.cyan },
		["@string.special.symbol"] = { fg = M.base_30.orange },
		["@string.special.url"] = { fg = M.base_30.cyan, underline = true },
		--
		--		["@character"] = { fg = M.base_30.green },
		--		["@character.special"] = { fg = M.base_30.cyan },
		--
		["@boolean"] = { fg = M.base_30.nord_blue, bold = true },
		["@number"] = { fg = M.base_30.cyan },
		["@number.float"] = { fg = M.base_30.cyan, italic = true },
		--
		--		["@type"] = { fg = M.base_30.cyan },
		--		["@type.builtin"] = { fg = M.base_30.cyan, bold = true },
		--		["@type.definition"] = { fg = M.base_30.cyan },
		--		["@type.qualifier"] = { fg = M.base_30.red },
		--
		--		["@attribute"] = { fg = M.base_30.cyan },
		--		["@attribute.builtin"] = { fg = M.base_30.cyan, bold = true },
		--		["@property"] = { fg = M.base_30.fg },
		--
		["@function"] = { fg = M.base_30.orange, bold = true },
		["@function.builtin"] = { fg = M.base_30.orange, bold = true },
		["@function.call"] = { fg = M.base_30.orange, italic = true },
		--		["@function.macro"] = { fg = M.base_30.orange },
		["@function.method"] = { fg = M.base_30.orange, bold = false },
		["@function.method.call"] = { fg = M.base_30.orange, bold = false, italic = true },
		--
		--		["@constructor"] = { fg = M.base_30.cyan },
		--		["@operator"] = { fg = M.base_30.orange },
		--
		--		["@keyword"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.coroutine"] = { fg = M.base_30.red, bold = true },
		["@keyword.function"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.operator"] = { fg = M.base_30.red },
		--		["@keyword.import"] = { fg = M.base_30.cyan },
		--		["@keyword.type"] = { fg = M.base_30.red },
		--		["@keyword.modifier"] = { fg = M.base_30.red },
		--		["@keyword.repeat"] = { fg = M.base_30.red, bold = true },
		["@keyword.return"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.debug"] = { fg = M.base_30.red },
		["@keyword.exception"] = { fg = M.base_30.red, bold = true },
		["@keyword.conditional"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.conditional.ternary"] = { fg = M.base_30.red },
		--		["@keyword.directive"] = { fg = M.base_30.cyan },
		--		["@keyword.directive.define"] = { fg = M.base_30.cyan },
		--
		--		["@punctuation.special"] = { fg = M.base_30.cyan },
		--
		["@comment"] = { fg = M.base_30.light_grey, italic = true },
		-- ["@comment.documentation"] = { fg = M.base_30.light_grey, italic = true },
		--		["@comment.error"] = { fg = M.base_30.white, bg = M.base_30.red },
		--		["@comment.warning"] = { fg = M.base_30.black, bg = M.base_30.yellow },
		--		["@comment.todo"] = { fg = M.base_30.black, bg = M.base_30.yellow, bold = true },
		--		["@comment.note"] = { fg = M.base_30.black, bg = M.base_30.cyan },
		--
		--		["@markup.strong"] = { bold = true },
		--		["@markup.italic"] = { italic = true },
		--		["@markup.strikethrough"] = { strikethrough = true },
		--		["@markup.underline"] = { underline = true },
		--		["@markup.heading"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.1"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.2"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.3"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.4"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.5"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.heading.6"] = { fg = M.base_30.purple, bold = true },
		--		["@markup.quote"] = { fg = M.base_30.grey, italic = true },
		--		["@markup.math"] = { fg = M.base_30.cyan },
		--		["@markup.link"] = { fg = M.base_30.cyan, underline = true },
		["@markup.link.label"] = { fg = M.base_30.cyan },
		["@markup.link.url"] = { fg = M.base_30.cyan, underline = true },
		--		["@markup.raw"] = { fg = M.base_30.green },
		--		["@markup.raw.block"] = { fg = M.base_30.green },
		--		["@markup.list"] = { fg = M.base_30.orange },
		--		["@markup.list.checked"] = { fg = M.base_30.green },
		--		["@markup.list.unchecked"] = { fg = M.base_30.grey },
		--
		--		["@tag"] = { fg = M.base_30.red },
		--		["@tag.attribute"] = { fg = M.base_30.orange },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "minty")

return M
