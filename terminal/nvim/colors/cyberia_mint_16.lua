local M = {}

-- Define base16 colors
local colors = {
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

function M.setup()
    -- Reset highlighting
    vim.cmd "hi clear"
    if vim.fn.exists "syntax_on" then
        vim.cmd "syntax reset"
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "minty"
    -- NOTE:
    -- Helper function to set highlights
    local function hl(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Basic vim highlights
    hl("Normal", { fg = colors.base05, bg = colors.base00 })
    hl("Comment", { fg = colors.base03, italic = true })
    hl("Constant", { fg = colors.base09 })
    hl("String", { fg = colors.base0B })
    hl("Character", { fg = colors.base0B })
    hl("Number", { fg = colors.base09 })
    hl("Boolean", { fg = colors.base09 })
    hl("Float", { fg = colors.base09 })
    hl("Identifier", { fg = colors.base08 })
    hl("Function", { fg = colors.base0D })
    hl("Statement", { fg = colors.base0E })
    hl("Conditional", { fg = colors.base0E })
    hl("Repeat", { fg = colors.base0E })
    hl("Label", { fg = colors.base0E })
    hl("Operator", { fg = colors.base05 })
    hl("Keyword", { fg = colors.base0E })
    hl("Exception", { fg = colors.base0E })
    hl("PreProc", { fg = colors.base0A })
    hl("Include", { fg = colors.base0D })
    hl("Define", { fg = colors.base0E })
    hl("Type", { fg = colors.base0A })
    hl("StorageClass", { fg = colors.base0A })
    hl("Structure", { fg = colors.base0E })
    hl("Special", { fg = colors.base0C })
    hl("Underlined", { fg = colors.base0D, underline = true })
    hl("Error", { fg = colors.base00, bg = colors.base08 })
    hl("Todo", { fg = colors.base0A, bg = colors.base01 })

    -- Treesitter highlights based on your polish_hl
    -- Variables
    hl("@variable", { fg = colors.base05 })
    hl("@variable.builtin", { fg = colors.base09, italic = true })
    hl("@variable.parameter", { fg = colors.base09 })

    -- Constants
    hl("@constant", { fg = colors.base09, bold = true })
    hl("@constant.builtin", { fg = colors.base09, bold = true })
    hl("@constant.macro", { fg = colors.base09 })

    -- Modules/Namespaces
    hl("@module", { fg = colors.base09 })
    hl("@module.builtin", { fg = colors.base09, bold = true })

    -- Labels
    hl("@label", { fg = colors.base0E })

    -- Strings
    hl("@string", { fg = colors.base0B })
    hl("@string.regex", { fg = colors.base0B })
    hl("@string.escape", { fg = colors.base0C })
    hl("@string.special", { fg = colors.base0C })
    hl("@string.special.symbol", { fg = colors.base09 })
    hl("@string.special.url", { fg = colors.base0C, underline = true })

    -- Characters
    hl("@character", { fg = colors.base0B })
    hl("@character.special", { fg = colors.base0D })

    -- Booleans and Numbers
    hl("@boolean", { fg = colors.base09, bold = true })
    hl("@number", { fg = colors.base09, italic = true })
    hl("@number.float", { fg = colors.base09, italic = true })

    -- Types
    hl("@type", { fg = colors.base0D })
    hl("@type.builtin", { fg = colors.base0D, bold = true })
    hl("@type.definition", { fg = colors.base0D })
    hl("@type.qualifier", { fg = colors.base0E })

    -- Attributes and Properties
    hl("@attribute", { fg = colors.base0D })
    hl("@attribute.builtin", { fg = colors.base0D, bold = true })
    hl("@property", { fg = colors.base05 })

    -- Functions
    hl("@function", { fg = colors.base0D, bold = true })
    hl("@function.builtin", { fg = colors.base0D, bold = true })
    hl("@function.call", { fg = colors.base0D, italic = true })
    hl("@function.macro", { fg = colors.base09 })
    hl("@function.method", { fg = colors.base0D, bold = false })
    hl("@function.method.call", { fg = colors.base0D, bold = false, italic = true })

    -- Constructor and Operators
    hl("@constructor", { fg = colors.base0D })
    hl("@operator", { fg = colors.base09 })

    -- Keywords
    hl("@keyword", { fg = colors.base0E, bold = true })
    hl("@keyword.coroutine", { fg = colors.base0E, bold = true })
    hl("@keyword.function", { fg = colors.base0E, bold = true })
    hl("@keyword.operator", { fg = colors.base0E })
    hl("@keyword.import", { fg = colors.base0D })
    hl("@keyword.type", { fg = colors.base0E })
    hl("@keyword.modifier", { fg = colors.base0E })
    hl("@keyword.repeat", { fg = colors.base0E, bold = true })
    hl("@keyword.return", { fg = colors.base0E, bold = true })
    hl("@keyword.debug", { fg = colors.base0E })
    hl("@keyword.exception", { fg = colors.base0E, bold = true })
    hl("@keyword.conditional", { fg = colors.base0E, bold = true })
    hl("@keyword.conditional.ternary", { fg = colors.base0E })
    hl("@keyword.directive", { fg = colors.base0D })
    hl("@keyword.directive.define", { fg = colors.base0D })

    -- Punctuation
    hl("@punctuation.special", { fg = colors.base0D })

    -- Comments
    hl("@comment", { fg = colors.base03, italic = true })
    hl("@comment.documentation", { fg = colors.base03, italic = true })
    hl("@comment.error", { fg = colors.base07, bg = colors.base0E })
    hl("@comment.warning", { fg = colors.base00, bg = colors.base0A })
    hl("@comment.todo", { fg = colors.base00, bg = colors.base0A, bold = true })
    hl("@comment.note", { fg = colors.base00, bg = colors.base0D })

    -- Markup
    hl("@markup.strong", { bold = true })
    hl("@markup.italic", { italic = true })
    hl("@markup.strikethrough", { strikethrough = true })
    hl("@markup.underline", { underline = true })
    hl("@markup.heading", { fg = colors.base0E, bold = true })
    hl("@markup.heading.1", { fg = colors.base0E, bold = true })
    hl("@markup.heading.2", { fg = colors.base0E, bold = true })
    hl("@markup.heading.3", { fg = colors.base0E, bold = true })
    hl("@markup.heading.4", { fg = colors.base0E, bold = true })
    hl("@markup.heading.5", { fg = colors.base0E, bold = true })
    hl("@markup.heading.6", { fg = colors.base0E, bold = true })
    hl("@markup.quote", { fg = colors.base03, italic = true })
    hl("@markup.math", { fg = colors.base0D })
    hl("@markup.link", { fg = colors.base0D, underline = true })
    hl("@markup.link.label", { fg = colors.base0D })
    hl("@markup.link.url", { fg = colors.base0D, underline = true })
    hl("@markup.raw", { fg = colors.base0B })
    hl("@markup.raw.block", { fg = colors.base0B })
    hl("@markup.list", { fg = colors.base09 })
    hl("@markup.list.checked", { fg = colors.base0B })
    hl("@markup.list.unchecked", { fg = colors.base03 })

    -- Tags (HTML/XML)
    hl("@tag", { fg = colors.base0E })
    hl("@tag.attribute", { fg = colors.base09 })

    -- Editor UI elements
    hl("LineNr", { fg = colors.base03, bg = colors.base01 })
    hl("CursorLine", { bg = colors.base01 })
    hl("CursorLineNr", { fg = colors.base04, bg = colors.base01 })
    hl("Visual", { bg = colors.base02 })
    hl("VisualNOS", { bg = colors.base02 })
    hl("Search", { fg = colors.base01, bg = colors.base0A })
    hl("IncSearch", { fg = colors.base01, bg = colors.base09 })
    hl("StatusLine", { fg = colors.base04, bg = colors.base01 })
    hl("StatusLineNC", { fg = colors.base03, bg = colors.base01 })
    hl("VertSplit", { fg = colors.base02, bg = colors.base00 })
    hl("Pmenu", { fg = colors.base05, bg = colors.base01 })
    hl("PmenuSel", { fg = colors.base01, bg = colors.base05 })
    hl("PmenuSbar", { bg = colors.base02 })
    hl("PmenuThumb", { bg = colors.base07 })
end

M.setup()

return M
