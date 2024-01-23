# Nushell Config File

use ~/github/nushell/nu_scripts/custom-completions/git/git-completions.nu *
use ~/github/nushell/nu_scripts/custom-completions/cargo/cargo-completions.nu *
use ~/github/nushell/nu_scripts/custom-completions/npm/npm-completions.nu *
# use ~/github/nushell/nu_scripts/custom-completions/just/just-completions.nu *
use ~/github/nushell/nu_scripts/custom-completions/typst/typst-completions.nu *
use ~/github/nushell/nu_scripts/custom-completions/zellij/zellij-completions.nu *

use "/Users/chris/Library/Application Support/nushell/git-aliases.nu" *
# # Get just the extern definitions without the custom completion commands
# use completions *

# for more information on themes see
# https://github.com/nushell/nushell/blob/main/docs/How_To_Coloring_and_Theming.md
let default_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr non effectively turns this off
    header: green_bold
    empty: blue
    bool: white
    int: white
    filesize: white
    duration: white
    date: white
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray

    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_binary: purple_bold
    shape_bool: light_cyan
    shape_int: purple_bold
    shape_float: purple_bold
    shape_range: yellow_bold
    shape_internalcall: cyan_bold
    shape_external: cyan
    shape_externalarg: green_bold
    shape_literal: blue
    shape_operator: yellow
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_datetime: cyan_bold
    shape_list: cyan_bold
    shape_table: blue_bold
    shape_record: cyan_bold
    shape_block: blue_bold
    shape_filepath: cyan
    shape_globpattern: cyan_bold
    shape_variable: purple
    shape_flag: blue_bold
    shape_custom: green
    shape_nothing: light_cyan
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  show_banner: false
  ls: {
    use_ls_colors: false # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }
  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }
  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }
  color_config: $default_theme
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  # animate_prompt: false # redraw the prompt every second
  float_precision: 2
  use_ansi_coloring: true
  edit_mode: emacs # emacs, vi
  history: {
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
  }
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  }
  # menu_config: {
  #   columns: 4
  #   col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
  #   col_padding: 2
  #   text_style: green
  #   selected_text_style: green_reverse
  #   marker: "| "
  # }
  # history_config: {
  #   page_size: 10
  #   selector: "!"
  #   text_style: green
  #   selected_text_style: green_reverse
  #   marker: "? "
  # }
  hooks: {
    pre_prompt: [{ ||
    if (which direnv | is-empty) {
      return
    }

    direnv export json | from json | default {} | load-env
  }]
  }
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: emacs # Options: emacs vi_normal vi_insert
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_x
      mode: emacs
      event: {
        until: [
          { send: menu name: history_menu }
          { send: menupagenext }
        ]
      }
    }
    {
      name: history_previous
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
      }
    }
  ]
}


# zoxide init nushell --hook prompt | save ~/.zoxide.nu
# source ~/.zoxide.nu
alias s = git status -sb
# alias g = git
# alias ga = git add
# alias gaa = git add --all
# alias gapa = git add --patch
# alias gau = git add --update
# alias gb = git branch
# alias gba = git branch -a
# alias gbd = git branch -d
# alias gbl = git blame -b -w
# alias gbnm = git branch --no-merged
# alias gbr = git branch --remote
# alias gbs = git bisect
# alias gbsb = git bisect bad
# alias gbsg = git bisect good
# alias gbsr = git bisect reset
# alias gbss = git bisect start
# alias gc = git commit -v
# alias gc! = git commit -v --amend
# alias gca = git commit -v -a
# alias gca! = git commit -v -a --amend
# alias gcam = git commit -a -m
# alias gcan! = git commit -v -a --no-edit --amend
# alias gcans! = git commit -v -a -s --no-edit --amend
# alias gcb = git checkout -b
# alias gcd = git checkout develop
# alias gcf = git config --list
# alias gcl = git clone --recursive
# alias gclean = git clean -fd
# alias gcm = git checkout master
# alias gcmsg = git commit -m
# alias gcn! = git commit -v --no-edit --amend
# alias gco = git checkout
# alias gcount = git shortlog -sn
# alias gcp = git cherry-pick
# alias gcpa = git cherry-pick --abort
# alias gcpc = git cherry-pick --continue
# alias gcs = git commit -S
# alias gcsm = git commit -s -m
# alias gd = git diff
# alias gdca = git diff --cached
# alias gdt = git diff-tree --no-commit-id --name-only -r
# alias gdw = git diff --word-diff
# alias gf = git fetch
# alias gfa = git fetch --all --prune
# alias gfo = git fetch origin
# alias gg = git gui citool
# alias gga = git gui citool --amend
# alias ggpull = git pull origin (git_current_branch)
# alias ggpur = ggu
# alias ggpush = git push origin (git_current_branch)
# alias ggsup = git branch --set-upstream-to=origin/(git_current_branch)
# alias ghh = git help
# alias gignore = git update-index --assume-unchanged
# alias gk = gitk --all --branches
# alias gke = gitk --all (git log -g --pretty=%h)
# alias gl = git pull
# alias glg = git log --stat
# alias glgg = git log --graph
# alias glgga = git log --graph --decorate --all
# alias glgm = git log --graph --max-count=10
# alias glgp = git log --stat -p
# alias glo = git log --oneline --decorate
# alias globurl = noglob urlglobber 
# alias glog = git log --oneline --decorate --graph
# alias gloga = git log --oneline --decorate --graph --all
# alias glol = git log --graph --pretty=\%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\ --abbrev-commit
# alias glola = git log --graph --pretty=\%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\ --abbrev-commit --all
# alias glp = _git_log_prettily
# alias glum = git pull upstream master
# alias gm = git merge
# alias gmom = git merge origin/master
# alias gmt = git mergetool --no-prompt
# alias gmtvim = git mergetool --no-prompt --tool=vimdiff
# alias gmum = git merge upstream/master
# alias gp = git push
# alias gpd = git push --dry-run
# alias gpoat = git push origin --all; git push origin --tags
# alias gpristine = git reset --hard; git clean -dfx
# alias gpsup = git push --set-upstream origin (git_current_branch)
# alias gpu = git push upstream
# alias gpv = git push -v
# alias gr = git remote
# alias gra = git remote add
# alias grb = git rebase
# alias grba = git rebase --abort
# alias grbc = git rebase --continue
# alias grbi = git rebase -i
# alias grbm = git rebase master
# alias grbs = git rebase --skip
# alias grep = grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}
# alias grh = git reset HEAD
# alias grhh = git reset HEAD --hard
# alias grmv = git remote rename
# alias grrm = git remote remove
# alias grset = git remote set-url
# # alias grt = cd (try {
# #   git rev-parse --show-toplevel
# # } catch {
# #   echo "."
# # })
# alias gru = git reset --
# alias grup = git remote update
# alias grv = git remote -v
# alias gsb = git status -sb
# alias gsd = git svn dcommit
# alias gsi = git submodule init
# alias gsps = git show --pretty=short --show-signature
# alias gsr = git svn rebase
# alias gss = git status -s
# alias gst = git status
# alias gsta = git stash save
# alias gstaa = git stash apply
# alias gstc = git stash clear
# alias gstd = git stash drop
# alias gstl = git stash list
# alias gstp = git stash pop
# alias gsts = git stash show --text
# alias gsu = git submodule update
# alias gts = git tag -s
# # alias gtv = (git tag | sort -V)
# alias gunignore = git update-index --no-assume-unchanged
# alias gup = git pull --rebase
# alias gupv = git pull --rebase -v
# alias gwch = git whatchanged -p --abbrev-commit --pretty=medium
# alias gwip = git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"

def wav-to-video [file] {
  ffmpeg -f lavfi -i color=c=black:s=3840x2160:rate=30 -i $file -crf 0 -c:a copy -shortest audio-with-black-video.mkv
  ffmpeg -i audio-with-black-video.mkv audio-with-black-video.mp4
}

[{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
    }]

        
# def --env load-direnv-for-zellij [] {
#   let direnv = (direnv export json | from json)
#   let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
#   $direnv | load-env
# }

def --env load-direnv-for-zellij [] {
  if (which direnv | is-empty) {
    return
  }

  direnv export json | from json | default {} | load-env
}

source ~/.local/share/atuin/init.nu

