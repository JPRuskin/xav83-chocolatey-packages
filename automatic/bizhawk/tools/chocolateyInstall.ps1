$ErrorActionPreference = 'Stop'

$url64       = 'https://github.com/TASVideos/BizHawk/releases/download/2.6.3/BizHawk-2.6.3-win-x64.zip'
$checksum64  = '374076fbbd53c65cce6aea670f516050084b881e025e2ff5b9b0df54fd0dcc41'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'ZIP'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs
