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
