$vim_config_path = "~\AppData\Local\nvim"

# ENVS
$Env:MYVIMRC = "$vim_config_path\init.vim"

# Aliases
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
