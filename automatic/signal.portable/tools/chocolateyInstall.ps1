$ErrorActionPreference = 'Stop'

$url64       = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/SILENT /SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /NOCLOSEAPPLICATIONS /NOFORCECLOSEAPPLICATIONS /NORESTARTAPPLICATIONS /NOICONS'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs