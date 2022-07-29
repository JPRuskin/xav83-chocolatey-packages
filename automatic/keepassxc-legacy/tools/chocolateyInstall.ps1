$ErrorActionPreference = 'Stop'

$url64       = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = "/quiet"
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
