$ErrorActionPreference = 'Stop'

$url32       = 'https://github.com/joncampbell123/dosbox-x/releases/download/dosbox-x-v0.83.14/dosbox-x-windows-0.83.14-setup.exe'
$checksum32  = '9547250ac5db83cb1e2c10433df59ab2efdfa0c97b541199ea041f2b07d05df8'

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
