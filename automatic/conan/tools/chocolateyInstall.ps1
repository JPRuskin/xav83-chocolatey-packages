$ErrorActionPreference = 'Stop'

$packageName = 'conan'
$url32       = 'https://github.com/conan-io/conan/releases/download/1.39.0/conan-win-32.exe'
$url64       = 'https://github.com/conan-io/conan/releases/download/1.39.0/conan-win-64.exe'
$checksum32  = 'ce3dbb37465eb6190b0aa7da66ee307d9a413bea59a3edf49d252efb8fda1ece'
$checksum64  = '59d0b0b3f4418cd7846160a00ff2e1f2c2e5c6c665836d52954c1c25af213d73'

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

# Add conan to PATH
$conan_path = "C:\Program Files\Conan\conan"
Install-ChocolateyPath -PathToInstall $conan_path -PathType User
