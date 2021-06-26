$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = 'https://github.com/matusnovak/doxybook2/releases/download/v1.3.5/doxybook2-windows-win32-v1.3.5.zip'
$url64       = 'https://github.com/matusnovak/doxybook2/releases/download/v1.3.5/doxybook2-windows-win64-v1.3.5.zip'
$checksum32  = 'd340177746d8a0bef7b370948f9434af60d91a2bb50c79c8c9f0e30cba6709a1'
$checksum64  = 'b6215797b526443d6f98d69e0a263a48470b1211717c30a5dc08464e3bd214ba'

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
