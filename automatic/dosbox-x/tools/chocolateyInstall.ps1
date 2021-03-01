$ErrorActionPreference = 'Stop'

$url32       = 'https://github.com/joncampbell123/dosbox-x/releases/download/dosbox-x-v0.83.11/dosbox-x-windows-0.83.11-setup.exe'
$checksum32  = 'e1355518f0f7752f725b021fa08e3ad84956e1b1866e0616b77531b39cdf0d83'

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  fileType       = 'EXE'
  url       = $url32
  checksum     = $checksum32
  checksumType = 'sha256'
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
