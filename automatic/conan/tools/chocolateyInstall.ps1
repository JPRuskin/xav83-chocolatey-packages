$ErrorActionPreference = 'Stop'

$packageName = ''
$url32       = ''
$url64       = ''
$checksum32  = ''
$checksum64  = ''

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
if (!Get-PackageParameters['PathType']) { Get-PackageParameters['PathType'] = 'User' }

$conan_path = "C:\Program Files\Conan\conan"
Install-ChocolateyPath -PathToInstall $conan_path -PathType Get-PackageParameters['PathType']
