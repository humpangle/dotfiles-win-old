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
    --delete \
    $userfolder_src/snippets \
    $userfolder_src/keybindings.json \
    $userfolder_src/settings.json \
    $userfolder_destination
end
