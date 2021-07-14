$ErrorActionPreference = 'Stop'

$packageName = 'cairoshell'
$url32       = 'https://github.com/cairoshell/cairoshell/releases/download/v0.4.133/CairoSetup_32bit.exe'
$url64       = 'https://github.com/cairoshell/cairoshell/releases/download/v0.4.133/CairoSetup_64bit.exe'
$checksum32  = '34edfaebb6bb34368fb65f8ae438c1d743d7cedf38056b2bf3bc6d847bff5f39'
$checksum64  = 'c6408e7c9ec64e625526b758fa93da178c8e81bac9aef8853d016d1fc6fcc9eb'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/SD'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
