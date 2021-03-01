$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = 'https://github.com/Tracktion/pluginval/releases/download/v0.2.9/pluginval_Windows.zip'
$checksum64  = '60fbd0664dbc621791b0c426b90f489a5c8e8992f89e806e78e91f9275b5253d'

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
