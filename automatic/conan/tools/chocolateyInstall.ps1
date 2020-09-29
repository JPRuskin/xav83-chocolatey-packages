$ErrorActionPreference = 'Stop'

$packageName = 'conan'
$url32       = 'https://github.com/conan-io/conan/releases/download/1.25.0/conan-win-32_1_25_0.exe'
$url64       = 'https://github.com/conan-io/conan/releases/download/1.25.0/conan-win-64_1_25_0.exe'
$checksum32  = '9e1cf76f3cfa9ff74c6bcee8c1393e17cd0f39855055ce7e910ea7c823a4e9fe'
$checksum64  = '8c7fce0fcfb660831de55bebac5f2d0ab8700ae9089b13135d34df988cbb633e'

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
