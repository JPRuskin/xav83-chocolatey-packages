﻿$ErrorActionPreference = 'Stop'

$url64       = ''
$checksum64  = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/qn'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
