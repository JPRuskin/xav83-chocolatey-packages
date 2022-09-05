$ErrorActionPreference = 'Stop'

$url32       = ''
$url64       = ''
$checksum32  = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
}
Install-ChocolateyZipPackage @packageArgs

# unzip tar
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyUnzip -FileFullPath "$toolsDir\*.tar" -Destination $toolsDir
Remove-Item $toolsDir\*.tar -ErrorAction SilentlyContinue -Force
