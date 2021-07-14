$ErrorActionPreference = 'Stop'

$packageName = 'tvrename'
$url32       = ''
$checksum32  = ''

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  silentArgs     = '/SILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
