$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = ''
$checksum32  = ''

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url32Bit       = $url32
  checksum32     = $checksum32
  checksumType32 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
