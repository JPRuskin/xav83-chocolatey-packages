$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'ZIP'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs

# Excludes pluginval from getting shims (https://docs.chocolatey.org/en-us/create/create-packages#how-do-i-exclude-executables-from-getting-shims)
Get-ChildItem $PSScriptRoot\*.exe | ForEach-Object { New-Item "$_.ignore" -type file -force | Out-Null }

# Add pluginval to PATH
Install-ChocolateyPath -PathToInstall $PSScriptRoot -PathType User
