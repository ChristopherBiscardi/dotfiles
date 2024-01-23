# # Nushell Environment Config File

# def create_left_prompt [] {
#     let path_segment = ($env.PWD)

#     $path_segment
# }

# def create_right_prompt [] {
#     let time_segment = ([
#         (date now | date format '%m/%d/%Y %r')
#     ] | str collect)

#     $time_segment
# }

# # Use nushell functions to define your right and left prompt
# let-env PROMPT_COMMAND = { create_left_prompt }
# let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# # The prompt indicators are environmental variables that represent
# # the state of the prompt
# let-env PROMPT_INDICATOR = { "〉" }
# let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
# let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
# let-env PROMPT_MULTILINE_INDICATOR = { "::: " }


$env.PATH = ([$env.PATH, [
  "/Users/chris/.volta/bin",
  "/Users/chris/.cargo/bin",
  "/opt/homebrew/bin",
  "/Library/TeX/texbin",
  "/Library/Apple/usr/bin",
  "/usr/local/bin"
]] | flatten)


$env.EDITOR = "code -w"
# $env.LC_ALL = "en_US.UTF-8"
# $env.LSCOLORS = "Gxfxcxdxbxegedabagacad"
$env.VOLTA_HOME = "/Users/chris/.volta"

# mkdir ~/.cache/starship
# starship init nu | save ~/.cache/starship/init.nu
# source ~/.cache/starship/init.nu

$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.FLY_API_HOSTNAME = "_api.internal:4280" # or set to `127.0.0.1:4280` when using 'flyctl proxy'
# $env.FLY_API_TOKEN = (^fly auth token)