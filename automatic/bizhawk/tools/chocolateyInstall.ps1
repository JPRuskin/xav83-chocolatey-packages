$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url64       = 'https://github.com/TASVideos/BizHawk/releases/download/2.6.1/BizHawk-2.6.1-win-x64.zip'
$checksum64  = 'b2c15a03ce37f6807797a7d80a073c7fcf9d2365cb92d6828495e62e113f6d7e'

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
