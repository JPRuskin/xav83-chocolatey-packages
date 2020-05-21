$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = ''
$checksum32  = ''

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'ZIP'
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs
