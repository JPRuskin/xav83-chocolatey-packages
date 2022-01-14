$ErrorActionPreference = 'Stop'

$packageName = 'cairoshell'
$url32       = 'https://github.com/cairoshell/cairoshell/releases/download/v0.4.164/CairoSetup_32bit.exe'
$url64       = 'https://github.com/cairoshell/cairoshell/releases/download/v0.4.164/CairoSetup_64bit.exe'
$checksum32  = 'facfa69ff6a288c9e66693ab1fad9dccbf3bcbb824378178235d0f97f72c6a54'
$checksum64  = 'dd96c128f20b8a0268fda035afdd233286435d6fbd23843563450c8ebffc3da8'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Get-Process -Name CairoDesktop -ErrorAction SilentlyContinue | Stop-Process

Install-ChocolateyPackage @packageArgs
