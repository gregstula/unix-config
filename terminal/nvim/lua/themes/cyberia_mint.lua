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
	green = "#4BFF9F",
	vibrant_green = "#64FFAC",
	nord_blue = "#19FFFF",
	blue = "#87FFFF",
	seablue = "#5de3e0",
	yellow = "#f6eb53",
	sun = "#ffe763",
	purple = "#ffd7ff",
	dark_purple = "#e7b0e7",
	teal = "#5de3e0",
	orange = "#FF8702",
	cyan = "#5FFFCA",
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
	base09 = "#ff8702", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
	base0A = "#5FFFCA", -- Classes, Markup Bold, Search Text Background
	base0B = "#4BFF9F", -- Strings, Inherited Class, Markup Code, Diff Inserted
	base0C = "#aaaaff", -- Support, Regular Expressions, Escape Characters, Markup Quotes
	base0D = "#19FFFF", -- Functions, Methods, Attribute IDs, Headings
	base0E = "#FF407E", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
	base0F = "#91FFFF", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

M.polish_hl = {
	treesitter = {
		--		["@variable.builtin"] = { fg = M.base_16.base09, italic = true },
		--		["@variable.parameter"] = { fg = M.base_16.base09 },
		--
		["@constant"] = { fg = M.base_16.base09, bold = true },
		["@constant.builtin"] = { fg = M.base_16.base09, bold = true },
		["@constant.macro"] = { fg = M.base_16.base09 },
		--
		["@module"] = { fg = M.base_16.base09 },
		["@module.builtin"] = { fg = M.base_16.base09, bold = true },
		--
		--		["@label"] = { fg = M.base_30.red },
		--
		["@string"] = { fg = M.base_16.base0B },
		["@string.regex"] = { fg = M.base_16.base0B },
		["@string.escape"] = { fg = M.base_30.teal },
		["@string.special"] = { fg = M.base_30.teal },
		["@string.special.symbol"] = { fg = M.base_16.base09 },
		["@string.special.url"] = { fg = M.base_30.teal, underline = true },
		--
		--		["@character"] = { fg = M.base_16.base0B },
		--		["@character.special"] = { fg = M.base_16.base0D },
		--
		["@boolean"] = { fg = M.base_16.base09, bold = true },
		["@number"] = { fg = M.base_16.base09, italic = true },
		["@number.float"] = { fg = M.base_16.base09, italic = true },
		--
		--		["@type"] = { fg = M.base_16.base0D },
		--		["@type.builtin"] = { fg = M.base_16.base0D, bold = true },
		--		["@type.definition"] = { fg = M.base_16.base0D },
		--		["@type.qualifier"] = { fg = M.base_30.red },
		--
		--		["@attribute"] = { fg = M.base_16.base0D },
		--		["@attribute.builtin"] = { fg = M.base_16.base0D, bold = true },
		--		["@property"] = { fg = M.base_30.fg },
		--
		["@function"] = { fg = M.base_16.base0D, bold = true },
		["@function.builtin"] = { fg = M.base_16.base0D, bold = true },
		["@function.call"] = { fg = M.base_16.base0D, italic = true },
		--		["@function.macro"] = { fg = M.base_16.base09 },
		["@function.method"] = { fg = M.base_16.base0D, bold = false },
		["@function.method.call"] = { fg = M.base_16.base0D, bold = false, italic = true },
		--
		--		["@constructor"] = { fg = M.base_16.base0D },
		--		["@operator"] = { fg = M.base_16.base09 },
		--
		--		["@keyword"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.coroutine"] = { fg = M.base_30.red, bold = true },
		-- ["@keyword.function"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.operator"] = { fg = M.base_30.red },
		--		["@keyword.import"] = { fg = M.base_16.base0D },
		--		["@keyword.type"] = { fg = M.base_30.red },
		--		["@keyword.modifier"] = { fg = M.base_30.red },
		--		["@keyword.repeat"] = { fg = M.base_30.red, bold = true },
		-- ["@keyword.return"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.debug"] = { fg = M.base_30.red },
		-- ["@keyword.exception"] = { fg = M.base_30.red, bold = true },
		-- ["@keyword.conditional"] = { fg = M.base_30.red, bold = true },
		--		["@keyword.conditional.ternary"] = { fg = M.base_30.red },
		--		["@keyword.directive"] = { fg = M.base_16.base0D },
		--		["@keyword.directive.define"] = { fg = M.base_16.base0D },
		--
		--		["@punctuation.special"] = { fg = M.base_16.base0D },
		--
		["@comment"] = { fg = M.base_16.base03, italic = true },
	    ["@comment.documentation"] = { fg = M.base_16.base03, italic = true },
		["@comment.error"] = { fg = M.base_30.white, bg = M.base_30.red },
		["@comment.warning"] = { fg = M.base_30.black, bg = M.base_30.yellow },
		["@comment.todo"] = { fg = M.base_30.black, bg = M.base_30.yellow, bold = true },
		["@comment.note"] = { fg = M.base_30.black, bg = M.base_16.base0D, bold = true },
        -- NOTE: 
        -- TODO:
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
		--		["@markup.math"] = { fg = M.base_16.base0D },
		--		["@markup.link"] = { fg = M.base_16.base0D, underline = true },
		["@markup.link.label"] = { fg = M.base_16.base0D },
		["@markup.link.url"] = { fg = M.base_16.base0D, underline = true },
		--		["@markup.raw"] = { fg = M.base_16.base0B },
		--		["@markup.raw.block"] = { fg = M.base_16.base0B },
		--		["@markup.list"] = { fg = M.base_16.base09 },
		--		["@markup.list.checked"] = { fg = M.base_16.base0B },
		--		["@markup.list.unchecked"] = { fg = M.base_30.grey },
		--
		--		["@tag"] = { fg = M.base_30.red },
		--		["@tag.attribute"] = { fg = M.base_16.base09 },
	},
}

M.type = "dark"

M = require("base46").override_theme(M, "cyberia_mint")

return M
