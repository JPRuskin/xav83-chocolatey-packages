$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = 'https://github.com/matusnovak/doxybook2/releases/download/v1.3.6/doxybook2-windows-win32-v1.3.6.zip'
$url64       = 'https://github.com/matusnovak/doxybook2/releases/download/v1.3.6/doxybook2-windows-win64-v1.3.6.zip'
$checksum32  = 'ed8cfd0581201557c1397edbf08fc28c7336041e9f662356275e443e7a8b727d'
$checksum64  = 'ebbd0b7d717d5740e9a8ea478664a7254f01f35a99d9a86a102ccb616837a6fa'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'ZIP'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs
