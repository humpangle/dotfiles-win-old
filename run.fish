#!/usr/bin/env fish

function vscode_sync
  if test -z "$winuser"
    echo -e "\nwinuser must be set. Exiting."
    return
  end

  set userfolder_src ./user-name/AppData/Roaming/Code/User
  set userfolder_destination /c/Users/$winuser/AppData/Roaming/Code/User

  rsync \
    -avzP \
    $userfolder_src/snippets \
    $userfolder_src/keybindings.json \
    $userfolder_src/settings.json \
    $userfolder_destination

  set vimfolder_src ./user-name/AppData/Local/nvim
  set vimfolder_destination /c/Users/$winuser/AppData/Local/nvim

  rsync \
    -avzP \
    $vimfolder_src/lua \
    $vimfolder_src/init.vim \
    $vimfolder_src/regular.vim \
    $vimfolder_src/vscode.vim \
    $vimfolder_destination
end

set line '============='

function sync_unison
  if test -z "$winuser"
    echo -e "\nwinuser must be set. Exiting."
    return
  end

  for filename in 'settings.json' 'snippets' 'keybindings.json'
    set source "./user-name/AppData/Roaming/Code/User/$filename"
    echo -e "$line Syncing $source $line\n\n"

    unison \
      "$source" \
      "/c/Users/$winuser/AppData/Roaming/Code/User/$filename" \
      -fat

    echo -e "\n\n$line *DONE* syncing $source $line\n\n"
  end

  for filename in 'lua' 'init.vin' 'regular.vim' 'vscode.vim'
    set source "./user-name/AppData/Local/nvim/$filename"
    echo -e "$line Syncing $source $line\n\n"

    unison \
      "$source" \
      "/c/Users/$winuser/AppData/Local/nvim/$filename" \
    -fat

    echo -e "\n\n$line *DONE* syncing $source $line\n\n"
  end
end
