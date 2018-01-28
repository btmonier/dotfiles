# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#1d1f21'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#5f819d'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#8abeb7'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#cc6666'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#cc6666'

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/tmp'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 12pt monospace'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '12pt monospace'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '12pt monospace'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '12pt monospace'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 12pt monospace'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '12pt monospace'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '12pt monospace'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '12pt monospace'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '12pt monospace'

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = '"Misc Tamsyn"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '12pt monospace'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '12pt monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '12pt monospace'

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = 'cursive'

# Font family for fantasy fonts.
# Type: FontFamily
c.fonts.web.family.fantasy = 'fantasy'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = 'monospace'

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = 'sans'

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = 'serif'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = 'san'

# Default font size (in pixels) for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 13

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 in the environment. It's off by default
# as it can cause issues with some bitmap fonts. As an alternative to
# this, it's possible to set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = True

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://www.google.com'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?hl=en&q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://www.google.com'
