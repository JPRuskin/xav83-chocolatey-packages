$ErrorActionPreference = 'Stop'

$packageName = 'conan'
$url32       = 'https://github.com/conan-io/conan/releases/download/1.37.1/conan-win-32.exe'
$url64       = 'https://github.com/conan-io/conan/releases/download/1.37.1/conan-win-64.exe'
$checksum32  = '0b2b850ffdb7ab817e847fd103d33af182cb17f6c04b8ee68aeb7f9c04256948'
$checksum64  = '3d81067b0be01ebc9a3335b1d49488879fb8b5372b7a72d896e4248db9aa1c0f'

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
