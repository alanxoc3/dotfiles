local alan = {
  base0      = '#1B2229';
  base1      = '#1c1f24';
  base2      = '#202328';
  base3      = '#23272e';
  base4      = '#3f444a';
  base5      = '#5B6268';
  base6      = '#73797e';
  base7      = '#9ca0a4';
  base8      = '#b1b1b1';

  bg = '#000000';
  bg1 = '#504945';
  bg_popup = '#3E4556';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';

  fg = '#bbc2cf';
  fg_alt  = '#5B6268';

  red = '#EC5f67';
  magenta = '#d16d9e';
  orange = '#da8548';
  yellow = '#d8a657';
  -- green = '#98be65';
  green = '#5faf5f';
  cyan = '#56b6c2';
  blue = '#51afef';
  purple = '#ba8baf';
  teal = '#1abc9c';
  grey = '#928374';
  brown = '#666660';
  black = '#000000';

  bracket = '#80A0C2';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}

function alan.terminal_color()
  vim.g.terminal_color_0 = alan.bg
  vim.g.terminal_color_1 = alan.red
  vim.g.terminal_color_2 = alan.green
  vim.g.terminal_color_3 = alan.yellow
  vim.g.terminal_color_4 = alan.blue
  vim.g.terminal_color_5 = alan.purple
  vim.g.terminal_color_6 = alan.cyan
  vim.g.terminal_color_7 = alan.bg1
  vim.g.terminal_color_8 = alan.brown
  vim.g.terminal_color_9 = alan.red
  vim.g.terminal_color_10 = alan.green
  vim.g.terminal_color_11 = alan.yellow
  vim.g.terminal_color_12 = alan.blue
  vim.g.terminal_color_13 = alan.purple
  vim.g.terminal_color_14 = alan.cyan
  vim.g.terminal_color_15 = alan.fg
end

function alan.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg)
end


function alan.load_syntax()
  local syntax = {
    Normal = {fg = alan.fg,bg=alan.bg};
    Terminal = {fg = alan.fg,bg=alan.bg};
    SignColumn = {fg=alan.fg,bg=alan.bg};
    FoldColumn = {fg=alan.fg_alt,bg=alan.black};
    VertSplit = {fg=alan.black,bg=alan.bg};
    Folded = {fg=alan.grey,bg=alan.bg_highlight};
    EndOfBuffer = {fg=alan.bg,bg=alan.none};
    IncSearch = {fg=alan.bg1,bg=alan.orange,style=alan.none};
    Search = {fg=alan.bg,bg=alan.green};
    ColorColumn = {fg=alan.none,bg=alan.bg_highlight};
    Conceal = {fg=alan.grey,bg=alan.none};
    Cursor = {fg=alan.none,bg=alan.none,style='reverse'};
    vCursor = {fg=alan.none,bg=alan.none,style='reverse'};
    iCursor = {fg=alan.none,bg=alan.none,style='reverse'};
    lCursor = {fg=alan.none,bg=alan.none,style='reverse'};
    CursorIM = {fg=alan.none,bg=alan.none,style='reverse'};
    CursorColumn = {fg=alan.none,bg=alan.bg_highlight};
    CursorLine = {fg=alan.none,bg=alan.bg_highlight};
    LineNr = {fg=alan.base4};
    CursorLineNr = {fg=alan.blue};
    DiffAdd = {fg=alan.black,bg=alan.green};
    DiffChange = {fg=alan.black,bg=alan.yellow};
    DiffDelete = {fg=alan.black,bg=alan.red};
    DiffText = {fg=alan.black,bg=alan.fg};
    Directory = {fg=alan.bg1,bg=alan.none};
    ErrorMsg = {fg=alan.red,bg=alan.none,style='bold'};
    WarningMsg = {fg=alan.yellow,bg=alan.none,style='bold'};
    ModeMsg = {fg=alan.fg,bg=alan.none,style='bold'};
    MatchParen = {fg=alan.red,bg=alan.none};
    NonText = {fg=alan.bg1};
    Whitespace = {fg=alan.bg1};
    SpecialKey = {fg=alan.bg1};
    Pmenu = {fg=alan.fg,bg=alan.bg_popup};
    PmenuSel = {fg=alan.base0,bg=alan.blue};
    PmenuSelBold = {fg=alan.base0,g=alan.blue};
    PmenuSbar = {fg=alan.none,bg=alan.blue};
    PmenuThumb = {fg=alan.brown,bg=alan.brown};
    WildMenu = {fg=alan.fg,bg=alan.green};
    Question = {fg=alan.yellow};
    NormalFloat = {fg=alan.base8,bg=alan.bg_highlight};
    TabLineFill = {style=alan.none};
    TabLineSel = {bg=alan.base1};
    StatusLine = {fg=alan.base8,bg=alan.none,style=alan.none};
    StatusLineNC = {fg=alan.grey,bg=alan.none,style=alan.none};
    SpellBad = {fg=alan.red,bg=alan.none,style='undercurl'};
    SpellCap = {fg=alan.blue,bg=alan.none,style='undercurl'};
    SpellLocal = {fg=alan.cyan,bg=alan.none,style='undercurl'};
    SpellRare = {fg=alan.purple,bg=alan.none,style = 'undercurl'};
    Visual = {fg=alan.black,bg=alan.bg_visual};
    VisualNOS = {fg=alan.black,bg=alan.bg_visual};
    QuickFixLine = {fg=alan.purple,style='bold'};
    Debug = {fg=alan.orange};
    debugBreakpoint = {fg=alan.bg,bg=alan.red};

    Boolean = {fg=alan.orange};
    Number = {fg=alan.purple};
    Float = {fg=alan.purple};
    PreProc = {fg=alan.purple};
    PreCondit = {fg=alan.purple};
    Include = {fg=alan.purple};
    Define = {fg=alan.purple};
    Conditional = {fg=alan.purple};
    Repeat = {fg=alan.purple};
    Keyword = {fg=alan.red};
    Typedef = {fg=alan.red};
    Exception = {fg=alan.red};
    Statement = {fg=alan.red};
    Error = {fg=alan.red};
    StorageClass = {fg=alan.orange};
    Tag = {fg=alan.orange};
    Label = {fg=alan.orange};
    Structure = {fg=alan.orange};
    Operator = {fg=alan.magenta};
    Title = {fg=alan.orange,style='bold'};
    Special = {fg=alan.yellow};
    SpecialChar = {fg=alan.yellow};
    Type = {fg=alan.yellow};
    Function = {fg=alan.magenta,style='bold'};
    String = {fg=alan.green};
    Character = {fg=alan.green};
    Constant = {fg=alan.cyan};
    Macro = {fg=alan.cyan};
    Identifier = {fg=alan.blue};

    Comment = {fg=alan.base6};
    SpecialComment = {fg=alan.grey};
    Todo = {fg=alan.purple};
    Delimiter = {fg=alan.fg};
    Ignore = {fg=alan.grey};
    Underlined = {fg=alan.none,style='underline'};

    TSFunction = {fg=alan.yellow,style='bold'};
    TSMethod = {fg=alan.yellow,style='bold'};
    TSKeywordFunction = {fg=alan.blue};
    TSProperty = {fg=alan.cyan};
    TSType = {fg=alan.teal};
    TSPunctBracket = {fg=alan.bracket};

    vimCommentTitle = {fg=alan.grey,style='bold'};
    vimLet = {fg=alan.orange};
    vimVar = {fg=alan.cyan};
    vimFunction = {fg=alan.magenta,style='bold'};
    vimIsCommand = {fg=alan.fg};
    vimCommand = {fg=alan.blue};
    vimNotFunc = {fg=alan.purple,style='bold'};
    vimUserFunc = {fg=alan.yellow,style='bold'};
    vimFuncName= {fg=alan.yellow,style='bold'};

    diffAdded = {fg = alan.green};
    diffRemoved = {fg =alan.red};
    diffChanged = {fg = alan.blue};
    diffOldFile = {fg = alan.yellow};
    diffNewFile = {fg = alan.orange};
    diffFile    = {fg = alan.aqua};
    diffLine    = {fg = alan.grey};
    diffIndexLine = {fg = alan.purple};

    gitcommitSummary = {fg = alan.red};
    gitcommitUntracked = {fg = alan.grey};
    gitcommitDiscarded = {fg = alan.grey};
    gitcommitSelected = { fg=alan.grey};
    gitcommitUnmerged = { fg=alan.grey};
    gitcommitOnBranch = { fg=alan.grey};
    gitcommitArrow  = {fg = alan.grey};
    gitcommitFile  = {fg = alan.green};

    VistaBracket = {fg=alan.grey};
    VistaChildrenNr = {fg=alan.orange};
    VistaKind = {fg=alan.purpl};
    VistaScope = {fg=alan.red};
    VistaScopeKind = {fg=alan.blue};
    VistaTag = {fg=alan.green,style='bold'};
    VistaPrefix = {fg=alan.grey};
    VistaColon = {fg=alan.green};
    VistaIcon = {fg=alan.yellow};
    VistaLineNr = {fg=alan.fg};

    GitGutterAdd = {fg=alan.green};
    GitGutterChange = {fg=alan.blue};
    GitGutterDelete = {fg=alan.red};
    GitGutterChangeDelete = {fg=alan.purple};

    SignifySignAdd = {fg=alan.green};
    SignifySignChange = {fg=alan.blue};
    SignifySignDelete = {fg=alan.red};

    dbui_tables = {fg=alan.blue};

    DefxIconsParentDirectory = {fg=alan.orange};
    Defx_filename_directory = {fg=alan.blue};
    Defx_filename_root = {fg=alan.red};

    DashboardShortCut = {fg=alan.purple};
    DashboardHeader = {fg=alan.orange};
    DashboardCenter = {fg=alan.blue};
    DashboardFooter = {fg=alan.grey};

    LspDiagnosticsError = {fg=alan.red};
    LspDiagnosticsWarning = {fg=alan.yellow};
    LspDiagnosticsInformation = {fg=alan.blue};
    LspDiagnosticsHint = {fg=alan.cyan};

    CursorWord0 = {bg=alan.currsor_bg};
    CursorWord1 = {bg=alan.currsor_bg};

    luaTreeFolderName = {fg=alan.blue};
    LuaTreeRootFolder = {fg=alan.red};
    LuaTreeSpecialFile = {fg=alan.fg,bg=alan.none,style='NONE'};

    TelescopeBorder = {fg=alan.teal};
    TelescopePromptBorder = {fg=alan.blue}
  }
  return syntax
end

-- function alan.get_alan_color()
  -- return alan
-- end

function alan.colorscheme()
  vim.o.termguicolors = true
  vim.api.nvim_command('hi clear')
  -- vim.api.nvim_command('syntax reset')
  vim.g.colors_name = 'alan'
  vim.o.background = 'dark'

  alan.terminal_color()

  local syntax = alan.load_syntax()
  for group,colors in pairs(syntax) do
     -- vim.api.nvim_exec([[let x = input("]] .. group .. [[ ")]], false)
     -- print(group)
     alan.highlight(group,colors)
  end
end

alan.colorscheme()

-- return alan
