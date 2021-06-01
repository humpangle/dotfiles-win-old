$vim_config_path = "~\AppData\Local\nvim"

# ENVS
$Env:MYVIMRC = "$vim_config_path\init.vim"

$fzf_preview_app = "--preview 'bat.exe --style=numbers --color=always --line-range :500 {}'"
$Env:FZF_DEFAULT_OPTS = "--layout=reverse $fzf_preview_app"
$Env:RG_IGNORES = "!{.git,node_modules,cover,coverage,.elixir_ls,deps,_build,.build,build,autoload}"

$fzf_command_ignores = "rg --files --hidden --follow --glob $Env:RG_IGNORES . 2> nul"
$Env:FZF_DEFAULT_COMMAND = $fzf_command_ignores

$fzf_command_no_ignores = "rg --files --hidden --follow . 2> nul"

# Aliases
function Get-FzfCommandToggle {
  if ($Env:FZF_DEFAULT_COMMAND -eq $fzf_command_ignores) {
    $Env:FZF_DEFAULT_COMMAND = $fzf_command_no_ignores
  }
  else {
    $Env:FZF_DEFAULT_COMMAND = $fzf_command_ignores

  }
}
New-Alias -Name "fft" Get-FzfCommandToggle

New-Alias -Name "ll" Get-ChildItem

function Edit-Shell {
  $Env:Path = `
    [System.Environment]::GetEnvironmentVariable("Path", "Machine") + `
    ";" + `
    [System.Environment]::GetEnvironmentVariable("Path", "User")
}
New-Alias -Name "eshell" Edit-Shell

function Switch-Nvm {
  if (Test-Path .nvmrc) {
    nvm use $(Get-Content .nvmrc)
  }
}
New-Alias -Name "usenvm" Switch-Nvm

function Get-KanmiiGitStatus {
  git status
}
New-Alias -Name "gss" Get-KanmiiGitStatus

function Get-KanmiiGitAddFolder {
  git add .
}
New-Alias -Name "ga." Get-KanmiiGitAddFolder

function Get-KanmiiCd1 {
  Set-Location ..
}
New-Alias -Name ".." Get-KanmiiCd1

function Get-KanmiiCd2 {
  Set-Location ../..
}
New-Alias -Name "..." Get-KanmiiCd2

function Get-KanmiiCd3 {
  Set-Location ../../..
}
New-Alias -Name "c3" Get-KanmiiCd3

function Get-KanmiiCd4 {
  Set-Location ../../../..
}
New-Alias -Name "c4" Get-KanmiiCd4

function Get-Which {
  param (
    $command
  )

  where.exe $command
}
New-Alias -Name "which" Get-Which

function Get-Nvim {
  param (
    $command
  )

  nvim.exe -u $Env:MYVIMRC $command
}
New-Alias -Name "vim" Get-Nvim

function New-KanmiiLink {
  param (
    $target,
    $link
  )

  New-Item -Path $link -ItemType SymbolicLink -Value $target
}
New-Alias -Name "ln" New-KanmiiLink
