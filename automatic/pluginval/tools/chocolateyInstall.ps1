$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = 'https://github.com/Tracktion/pluginval/releases/download/v0.3.0/pluginval_Windows.zip'
$checksum64  = '70d0154d1169f990c5c0d3759d5a3258d36659ef58ab42e917f345bed304e574'

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
