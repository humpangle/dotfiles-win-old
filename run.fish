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
