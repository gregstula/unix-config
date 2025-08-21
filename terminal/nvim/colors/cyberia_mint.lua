-- Cyberia Mint Colorscheme for Neovim
-- A modern colorscheme with full Treesitter support

local M = {}

function M.setup()
    vim.cmd "highlight clear"
    if vim.fn.exists "syntax_on" then
        vim.cmd "syntax reset"
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "cyberia_mint"

    -- Define color palette
    local colors = {
        -- Original colors from the scheme
        bg = "#010202",
        fg = "#d0d0d0",
        bg_alt = "#303030",
        bg_highlight = "#585858",

        -- Main colors
        cyan = "#5fd7ff",
        green = "#87ffaf",
        orange = "#ff8700",
        red = "#FF407E",
        yellow = "#f6eb53",
        purple = "#ffd7ff",
        gray = "#808080",
        light_gray = "#a8a8a8",
        dark_gray = "#6c6c6c",
        white = "#edeeeb",
        black = "#000000",

        -- Additional colors
        teal = "#5de3e0",
        blue = "#7b9ccd",
        pink = "#d70087",
        violet = "#a97ba7",
    }

    -- Helper function to set highlight groups
    local function hi(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Base highlights
    hi("Normal", { fg = colors.fg, bg = colors.bg })
    hi("NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
    hi("FloatBorder", { fg = colors.cyan, bg = colors.bg_alt })
    hi("Comment", { fg = colors.gray, italic = true })
    hi("Constant", { fg = colors.cyan, bold = true })
    hi("String", { fg = colors.green })
    hi("Character", { link = "String" })
    hi("Number", { fg = colors.cyan })
    hi("Boolean", { fg = colors.cyan, bold = true })
    hi("Float", { fg = colors.cyan })
    hi("Identifier", { fg = colors.orange, italic = true })
    hi("Function", { fg = colors.orange, bold = true })
    hi("Statement", { fg = colors.red, bold = true })
    hi("Conditional", { link = "Statement" })
    hi("Repeat", { link = "Statement" })
    hi("Label", { link = "Statement" })
    hi("Operator", { link = "Function" })
    hi("Keyword", { fg = colors.red, bold = true })
    hi("Exception", { link = "Statement" })
    hi("PreProc", { fg = colors.cyan })
    hi("Include", { link = "PreProc" })
    hi("Define", { link = "PreProc" })
    hi("Macro", { link = "PreProc" })
    hi("PreCondit", { link = "PreProc" })
    hi("Type", { fg = colors.cyan })
    hi("StorageClass", { link = "Identifier" })
    hi("Structure", { link = "Type" })
    hi("Typedef", { link = "Type" })
    hi("Special", { fg = colors.cyan })
    hi("SpecialChar", { link = "Special" })
    hi("Tag", { link = "Special" })
    hi("Delimiter", { link = "Special" })
    hi("SpecialComment", { link = "Special" })
    hi("Debug", { link = "Special" })
    hi("Underlined", { fg = colors.cyan, underline = true })
    hi("Ignore", { fg = colors.gray })
    hi("Error", { fg = colors.white, bg = colors.red })
    hi("Todo", { fg = colors.black, bg = colors.yellow, bold = true })

    -- UI Elements
    hi("ColorColumn", { bg = "#cc0000" })
    hi("Conceal", { fg = colors.gray })
    hi("Cursor", { fg = colors.bg, bg = colors.fg })
    hi("CursorIM", { fg = colors.bg, bg = colors.fg })
    hi("CursorColumn", { bg = colors.bg_alt })
    hi("CursorLine", { bg = colors.bg_highlight, underline = true })
    hi("CursorLineNr", { fg = colors.orange })
    hi("Directory", { fg = colors.cyan })
    hi("DiffAdd", { bg = "#3f3876" })
    hi("DiffChange", { bg = "#734e7a" })
    hi("DiffDelete", { fg = colors.pink, bg = "#5f005f", bold = true })
    hi("DiffText", { bg = "#878787", bold = true })
    hi("ErrorMsg", { fg = colors.white, bg = "#cc0000" })
    hi("VertSplit", { fg = colors.bg_alt, bg = "#080808", bold = true })
    hi("WinSeparator", { link = "VertSplit" })
    hi("Folded", { fg = colors.teal, bg = colors.dark_gray })
    hi("FoldColumn", { fg = colors.teal, bg = colors.dark_gray })
    hi("SignColumn", { fg = colors.teal, bg = colors.dark_gray })
    hi("IncSearch", { reverse = true })
    hi("Substitute", { fg = colors.black, bg = colors.yellow })
    hi("LineNr", { fg = colors.gray })
    hi("MatchParen", { bg = "#379897" })
    hi("ModeMsg", { bold = true })
    hi("MoreMsg", { fg = colors.green, bold = true })
    hi("NonText", { fg = colors.blue, bold = true })
    hi("Pmenu", { fg = colors.cyan, bg = colors.black })
    hi("PmenuSel", { fg = colors.dark_gray, bg = colors.black })
    hi("PmenuSbar", { bg = colors.light_gray })
    hi("PmenuThumb", { fg = colors.cyan, bg = "#8787af", bold = true })
    hi("Question", { fg = colors.green, bold = true })
    hi("QuickFixLine", { bg = colors.bg_alt, bold = true })
    hi("Search", { fg = colors.black, bg = colors.yellow })
    hi("SpecialKey", { fg = colors.cyan, italic = true })
    hi("SpellBad", { sp = colors.red, undercurl = true })
    hi("SpellCap", { sp = colors.blue, undercurl = true })
    hi("SpellLocal", { sp = colors.teal, undercurl = true })
    hi("SpellRare", { sp = colors.violet, undercurl = true })
    hi("StatusLine", { reverse = true, bold = true })
    hi("StatusLineNC", { reverse = true })
    hi("TabLine", { fg = colors.white, bg = colors.dark_gray, underline = true })
    hi("TabLineFill", { reverse = true })
    hi("TabLineSel", { bold = true })
    hi("Title", { fg = colors.purple, bold = true })
    hi("Visual", { fg = colors.black, bg = colors.light_gray })
    hi("VisualNOS", { link = "Visual" })
    hi("WarningMsg", { fg = "#ffffff", bg = "#444444", bold = true })
    hi("WildMenu", { fg = "#ffffff", bg = "#444444", bold = true })

    -- Neovim specific
    hi("NormalNC", { fg = colors.fg, bg = colors.bg })
    hi("MsgArea", { fg = colors.fg })
    hi("MsgSeparator", { fg = colors.gray })
    hi("NvimInternalError", { fg = colors.white, bg = colors.red })
    hi("TermCursor", { reverse = true })
    hi("TermCursorNC", { reverse = true })

    -- Treesitter highlights
    hi("@variable", { fg = colors.fg })
    hi("@variable.builtin", { fg = colors.orange, italic = true })
    hi("@variable.parameter", { fg = colors.orange })
    hi("@variable.member", { fg = colors.fg })

    hi("@constant", { fg = colors.cyan, bold = true })
    hi("@constant.builtin", { fg = colors.cyan, bold = true })
    hi("@constant.macro", { fg = colors.cyan })

    hi("@module", { fg = colors.orange })
    hi("@module.builtin", { fg = colors.orange, bold = true })

    hi("@label", { fg = colors.red })

    hi("@string", { fg = colors.green })
    hi("@string.regex", { fg = colors.green })
    hi("@string.escape", { fg = colors.cyan })
    hi("@string.special", { fg = colors.cyan })
    hi("@string.special.symbol", { fg = colors.orange })
    hi("@string.special.url", { fg = colors.cyan, underline = true })

    hi("@character", { fg = colors.green })
    hi("@character.special", { fg = colors.cyan })

    hi("@boolean", { fg = colors.cyan, bold = true })
    hi("@number", { fg = colors.cyan })
    hi("@number.float", { fg = colors.cyan })

    hi("@type", { fg = colors.cyan })
    hi("@type.builtin", { fg = colors.cyan, bold = true })
    hi("@type.definition", { fg = colors.cyan })
    hi("@type.qualifier", { fg = colors.red })

    hi("@attribute", { fg = colors.cyan })
    hi("@attribute.builtin", { fg = colors.cyan, bold = true })
    hi("@property", { fg = colors.fg })

    hi("@function", { fg = colors.orange, bold = true })
    hi("@function.builtin", { fg = colors.orange, bold = true })
    hi("@function.call", { fg = colors.orange })
    hi("@function.macro", { fg = colors.orange })
    hi("@function.method", { fg = colors.orange })
    hi("@function.method.call", { fg = colors.orange })

    hi("@constructor", { fg = colors.cyan })
    hi("@operator", { fg = colors.orange })

    hi("@keyword", { fg = colors.red, bold = true })
    hi("@keyword.coroutine", { fg = colors.red, bold = true })
    hi("@keyword.function", { fg = colors.red, bold = true })
    hi("@keyword.operator", { fg = colors.red })
    hi("@keyword.import", { fg = colors.cyan })
    hi("@keyword.type", { fg = colors.red })
    hi("@keyword.modifier", { fg = colors.red })
    hi("@keyword.repeat", { fg = colors.red, bold = true })
    hi("@keyword.return", { fg = colors.red, bold = true })
    hi("@keyword.debug", { fg = colors.red })
    hi("@keyword.exception", { fg = colors.red, bold = true })
    hi("@keyword.conditional", { fg = colors.red, bold = true })
    hi("@keyword.conditional.ternary", { fg = colors.red })
    hi("@keyword.directive", { fg = colors.cyan })
    hi("@keyword.directive.define", { fg = colors.cyan })

    hi("@punctuation.delimiter", { fg = colors.fg })
    hi("@punctuation.bracket", { fg = colors.fg })
    hi("@punctuation.special", { fg = colors.cyan })

    hi("@comment", { fg = colors.gray, italic = true })
    hi("@comment.documentation", { fg = colors.gray, italic = true })
    hi("@comment.error", { fg = colors.white, bg = colors.red })
    hi("@comment.warning", { fg = colors.black, bg = colors.yellow })
    hi("@comment.todo", { fg = colors.black, bg = colors.yellow, bold = true })
    hi("@comment.note", { fg = colors.black, bg = colors.cyan })

    hi("@markup.strong", { bold = true })
    hi("@markup.italic", { italic = true })
    hi("@markup.strikethrough", { strikethrough = true })
    hi("@markup.underline", { underline = true })
    hi("@markup.heading", { fg = colors.purple, bold = true })
    hi("@markup.heading.1", { fg = colors.purple, bold = true })
    hi("@markup.heading.2", { fg = colors.purple, bold = true })
    hi("@markup.heading.3", { fg = colors.purple, bold = true })
    hi("@markup.heading.4", { fg = colors.purple, bold = true })
    hi("@markup.heading.5", { fg = colors.purple, bold = true })
    hi("@markup.heading.6", { fg = colors.purple, bold = true })
    hi("@markup.quote", { fg = colors.gray, italic = true })
    hi("@markup.math", { fg = colors.cyan })
    hi("@markup.link", { fg = colors.cyan, underline = true })
    hi("@markup.link.label", { fg = colors.cyan })
    hi("@markup.link.url", { fg = colors.cyan, underline = true })
    hi("@markup.raw", { fg = colors.green })
    hi("@markup.raw.block", { fg = colors.green })
    hi("@markup.list", { fg = colors.orange })
    hi("@markup.list.checked", { fg = colors.green })
    hi("@markup.list.unchecked", { fg = colors.gray })

    hi("@tag", { fg = colors.red })
    hi("@tag.attribute", { fg = colors.orange })
    hi("@tag.delimiter", { fg = colors.fg })

    -- LSP and Diagnostics
    hi("DiagnosticError", { fg = colors.red })
    hi("DiagnosticWarn", { fg = colors.yellow })
    hi("DiagnosticInfo", { fg = colors.cyan })
    hi("DiagnosticHint", { fg = colors.green })
    hi("DiagnosticOk", { fg = colors.green })
    hi("DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
    hi("DiagnosticUnderlineWarn", { sp = colors.yellow, undercurl = true })
    hi("DiagnosticUnderlineInfo", { sp = colors.cyan, undercurl = true })
    hi("DiagnosticUnderlineHint", { sp = colors.green, undercurl = true })
    hi("DiagnosticUnderlineOk", { sp = colors.green, undercurl = true })
    hi("DiagnosticVirtualTextError", { fg = colors.red })
    hi("DiagnosticVirtualTextWarn", { fg = colors.yellow })
    hi("DiagnosticVirtualTextInfo", { fg = colors.cyan })
    hi("DiagnosticVirtualTextHint", { fg = colors.green })
    hi("DiagnosticVirtualTextOk", { fg = colors.green })
    hi("DiagnosticSignError", { fg = colors.red })
    hi("DiagnosticSignWarn", { fg = colors.yellow })
    hi("DiagnosticSignInfo", { fg = colors.cyan })
    hi("DiagnosticSignHint", { fg = colors.green })
    hi("DiagnosticSignOk", { fg = colors.green })

    hi("LspReferenceText", { bg = colors.bg_alt })
    hi("LspReferenceRead", { bg = colors.bg_alt })
    hi("LspReferenceWrite", { bg = colors.bg_alt, underline = true })
    hi("LspSignatureActiveParameter", { bg = colors.bg_alt, bold = true })
    hi("LspCodeLens", { fg = colors.gray })
    hi("LspCodeLensSeparator", { fg = colors.gray })
    hi("LspInlayHint", { fg = colors.gray, bg = colors.bg_alt })

    -- Git signs
    hi("GitSignsAdd", { fg = colors.green })
    hi("GitSignsChange", { fg = colors.yellow })
    hi("GitSignsDelete", { fg = colors.red })
    hi("GitSignsAddNr", { fg = colors.green })
    hi("GitSignsChangeNr", { fg = colors.yellow })
    hi("GitSignsDeleteNr", { fg = colors.red })
    hi("GitSignsAddLn", { bg = "#3f3876" })
    hi("GitSignsChangeLn", { bg = "#734e7a" })
    hi("GitSignsDeleteLn", { bg = "#5f005f" })

    -- Telescope
    hi("TelescopeNormal", { fg = colors.fg, bg = colors.bg })
    hi("TelescopeBorder", { fg = colors.cyan })
    hi("TelescopePromptNormal", { fg = colors.fg })
    hi("TelescopePromptBorder", { fg = colors.cyan })
    hi("TelescopeResultsNormal", { fg = colors.fg })
    hi("TelescopeResultsBorder", { fg = colors.cyan })
    hi("TelescopePreviewNormal", { fg = colors.fg })
    hi("TelescopePreviewBorder", { fg = colors.cyan })
    hi("TelescopeSelectionCaret", { fg = colors.orange })
    hi("TelescopeSelection", { bg = colors.bg_alt })
    hi("TelescopeMatching", { fg = colors.yellow, bold = true })

    -- nvim-cmp
    hi("CmpItemAbbrDeprecated", { fg = colors.gray, strikethrough = true })
    hi("CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
    hi("CmpItemAbbrMatchFuzzy", { fg = colors.yellow, bold = true })
    hi("CmpItemMenu", { fg = colors.gray })
    hi("CmpItemKindText", { fg = colors.fg })
    hi("CmpItemKindMethod", { fg = colors.orange })
    hi("CmpItemKindFunction", { fg = colors.orange })
    hi("CmpItemKindConstructor", { fg = colors.cyan })
    hi("CmpItemKindField", { fg = colors.fg })
    hi("CmpItemKindVariable", { fg = colors.fg })
    hi("CmpItemKindClass", { fg = colors.cyan })
    hi("CmpItemKindInterface", { fg = colors.cyan })
    hi("CmpItemKindModule", { fg = colors.orange })
    hi("CmpItemKindProperty", { fg = colors.fg })
    hi("CmpItemKindUnit", { fg = colors.cyan })
    hi("CmpItemKindValue", { fg = colors.cyan })
    hi("CmpItemKindEnum", { fg = colors.cyan })
    hi("CmpItemKindKeyword", { fg = colors.red })
    hi("CmpItemKindSnippet", { fg = colors.green })
    hi("CmpItemKindColor", { fg = colors.cyan })
    hi("CmpItemKindFile", { fg = colors.fg })
    hi("CmpItemKindReference", { fg = colors.fg })
    hi("CmpItemKindFolder", { fg = colors.cyan })
    hi("CmpItemKindEnumMember", { fg = colors.cyan })
    hi("CmpItemKindConstant", { fg = colors.cyan })
    hi("CmpItemKindStruct", { fg = colors.cyan })
    hi("CmpItemKindEvent", { fg = colors.orange })
    hi("CmpItemKindOperator", { fg = colors.orange })
    hi("CmpItemKindTypeParameter", { fg = colors.cyan })

    -- Indent Blankline
    hi("IblIndent", { fg = colors.bg_alt })
    hi("IblScope", { fg = colors.gray })

    -- Which Key
    hi("WhichKey", { fg = colors.orange, bold = true })
    hi("WhichKeyGroup", { fg = colors.cyan })
    hi("WhichKeyDesc", { fg = colors.fg })
    hi("WhichKeySeperator", { fg = colors.gray })
    hi("WhichKeyFloat", { bg = colors.bg_alt })
    hi("WhichKeyValue", { fg = colors.gray })

    -- Neo-tree
    hi("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
    hi("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
    hi("NeoTreeDirectoryName", { fg = colors.cyan })
    hi("NeoTreeDirectoryIcon", { fg = colors.cyan })
    hi("NeoTreeFileName", { fg = colors.fg })
    hi("NeoTreeFileIcon", { fg = colors.fg })
    hi("NeoTreeRootName", { fg = colors.orange, bold = true })
    hi("NeoTreeGitAdded", { fg = colors.green })
    hi("NeoTreeGitConflict", { fg = colors.red })
    hi("NeoTreeGitDeleted", { fg = colors.red })
    hi("NeoTreeGitModified", { fg = colors.yellow })
    hi("NeoTreeGitUntracked", { fg = colors.gray })
    hi("NeoTreeIndentMarker", { fg = colors.gray })
    hi("NeoTreeSymbolicLinkTarget", { fg = colors.cyan })

    -- Dashboard
    hi("DashboardHeader", { fg = colors.purple, bold = true })
    hi("DashboardCenter", { fg = colors.orange })
    hi("DashboardFooter", { fg = colors.gray })
    hi("DashboardKey", { fg = colors.orange, bold = true })
    hi("DashboardDesc", { fg = colors.fg })
    hi("DashboardIcon", { fg = colors.cyan })

    -- Notify
    hi("NotifyBackground", { bg = colors.bg })

    -- Mini.nvim
    hi("MiniIndentscopeSymbol", { fg = colors.gray })
    hi("MiniJump", { fg = colors.black, bg = colors.yellow, bold = true })
    hi("MiniJump2dSpot", { fg = colors.orange, bold = true })
    hi("MiniStarterCurrent", { bold = true })
    hi("MiniStarterFooter", { fg = colors.gray })
    hi("MiniStarterHeader", { fg = colors.purple, bold = true })
    hi("MiniStarterInactive", { fg = colors.gray })
    hi("MiniStarterItem", { fg = colors.fg })
    hi("MiniStarterItemBullet", { fg = colors.cyan })
    hi("MiniStarterItemPrefix", { fg = colors.orange })
    hi("MiniStarterSection", { fg = colors.cyan, bold = true })
    hi("MiniStarterQuery", { fg = colors.yellow })
    hi("MiniStatuslineDevinfo", { fg = colors.fg, bg = colors.bg_alt })
    hi("MiniStatuslineFileinfo", { fg = colors.fg, bg = colors.bg_alt })
    hi("MiniStatuslineFilename", { fg = colors.fg, bg = colors.bg_alt })
    hi("MiniStatuslineInactive", { fg = colors.gray, bg = colors.bg })
    hi("MiniStatuslineModeCommand", { fg = colors.black, bg = colors.yellow, bold = true })
    hi("MiniStatuslineModeInsert", { fg = colors.black, bg = colors.green, bold = true })
    hi("MiniStatuslineModeNormal", { fg = colors.black, bg = colors.cyan, bold = true })
    hi("MiniStatuslineModeOther", { fg = colors.black, bg = colors.orange, bold = true })
    hi("MiniStatuslineModeReplace", { fg = colors.black, bg = colors.red, bold = true })
    hi("MiniStatuslineModeVisual", { fg = colors.black, bg = colors.purple, bold = true })
    hi("MiniSurround", { link = "IncSearch" })
    hi("MiniTablineCurrent", { fg = colors.fg, bg = colors.bg_alt, bold = true })
    hi("MiniTablineFill", { bg = colors.bg })
    hi("MiniTablineHidden", { fg = colors.gray, bg = colors.bg_alt })
    hi("MiniTablineModifiedCurrent", { fg = colors.yellow, bg = colors.bg_alt, bold = true })
    hi("MiniTablineModifiedHidden", { fg = colors.yellow, bg = colors.bg_alt })
    hi("MiniTablineModifiedVisible", { fg = colors.yellow, bg = colors.bg_alt })
    hi("MiniTablineTabpagesection", { fg = colors.fg, bg = colors.bg_alt, bold = true })
    hi("MiniTablineVisible", { fg = colors.fg, bg = colors.bg_alt })
    hi("MiniTestEmphasis", { bold = true })
    hi("MiniTestFail", { fg = colors.red, bold = true })
    hi("MiniTestPass", { fg = colors.green, bold = true })
    hi("MiniTrailspace", { bg = colors.red })

    -- Language specific
    -- Markdown
    hi("@markup.heading.1.markdown", { fg = colors.purple, bold = true })
    hi("@markup.heading.2.markdown", { fg = colors.purple, bold = true })
    hi("@markup.heading.3.markdown", { fg = colors.purple, bold = true })
    hi("@markup.heading.4.markdown", { fg = colors.purple, bold = true })
    hi("@markup.heading.5.markdown", { fg = colors.purple, bold = true })
    hi("@markup.heading.6.markdown", { fg = colors.purple, bold = true })

    -- Legacy highlights for plugins that don't support @markup yet
    hi("markdownH1", { link = "@markup.heading.1.markdown" })
    hi("markdownH2", { link = "@markup.heading.2.markdown" })
    hi("markdownH3", { link = "@markup.heading.3.markdown" })
    hi("markdownH4", { link = "@markup.heading.4.markdown" })
    hi("markdownH5", { link = "@markup.heading.5.markdown" })
    hi("markdownH6", { link = "@markup.heading.6.markdown" })
    hi("markdownHeadingDelimiter", { fg = colors.gray })
    hi("markdownCode", { fg = colors.green })
    hi("markdownCodeBlock", { fg = colors.green })
    hi("markdownCodeDelimiter", { fg = colors.green })
    hi("markdownBlockquote", { fg = colors.gray })
    hi("markdownListMarker", { fg = colors.orange })
    hi("markdownRule", { fg = colors.gray })
    hi("markdownUrl", { fg = colors.cyan, underline = true })
    hi("markdownLinkText", { fg = colors.cyan })
    hi("markdownBold", { bold = true })
    hi("markdownItalic", { italic = true })
end

M.setup()

return M
