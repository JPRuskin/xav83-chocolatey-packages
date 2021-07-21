﻿$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$url32       = 'https://github.com/PhantomBot/PhantomBot/releases/download/v3.4.3/PhantomBot-3.4.3-arm.zip'
$checksum32  = 'aa2726d627bb81342128a0045951a32b5dd40f26ee7b095e060ca8130fbf6c1c'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'ZIP'
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs
