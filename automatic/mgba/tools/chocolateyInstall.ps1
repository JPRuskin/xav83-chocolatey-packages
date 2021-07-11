$ErrorActionPreference = 'Stop'

$packageName = 'mgba'
$url32       = 'https://github.com/mgba-emu/mgba/releases/download/0.9.2/mGBA-0.9.2-win32-installer.exe'
$url64       = 'https://github.com/mgba-emu/mgba/releases/download/0.9.2/mGBA-0.9.2-win64-installer.exe'
$checksum32  = '974ea1f358077761e4488898fba620d7e12dce7911d6f0c051d4071822c23183'
$checksum64  = 'd7b7fcf239e3c487c2250782ef896156bf3c44c009f9236afb59268c7684c61d'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
