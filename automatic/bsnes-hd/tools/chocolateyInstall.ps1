$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = 'https://github.com/DerKoun/bsnes-hd/releases/download/beta_10_6/bsnes_hd_beta_10_6_windows.zip'
$checksum64  = '31c4d27e74ff8d87e9e7da7ca9c64960d5f69e6b6d6c805120145e955067e445'

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
