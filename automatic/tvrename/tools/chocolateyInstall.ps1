$ErrorActionPreference = 'Stop'

$packageName = 'tvrename'
$url32       = 'https://github.com/TV-Rename/tvrename/releases/download/3.3.1/TVRename-3.3.1.exe'
$checksum32  = '8776f756da4346f29f757596b9a1a15f67c62b42fb996d4ceb71f79f68ee16b1'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
