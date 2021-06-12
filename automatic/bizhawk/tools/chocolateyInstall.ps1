$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = 'https://github.com/TASVideos/BizHawk/releases/download/2.6.2/BizHawk-2.6.2-win-x64.zip'
$checksum64  = '7ac5e2d5388ef81204e279ed07c19ef682f883618247c23fd037cee49f08bf34'

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
