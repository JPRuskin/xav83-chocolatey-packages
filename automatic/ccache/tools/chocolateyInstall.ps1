$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = 'https://github.com/ccache/ccache/releases/download/v4.4/ccache-4.4-windows-32.zip'
$url64       = 'https://github.com/ccache/ccache/releases/download/v4.4/ccache-4.4-windows-64.zip'
$checksum32  = 'ca96d86cd138681673412d65e9e0449a93a9648d185f5e3e68dc9a14e5377d9d'
$checksum64  = 'f6a9bf26ed501da666fd0067a47da96e35b74c91c3d367fdd7b309ead0accebe'

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
