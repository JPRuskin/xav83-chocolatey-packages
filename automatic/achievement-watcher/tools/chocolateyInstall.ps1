$ErrorActionPreference = 'Stop'

$url32       = 'https://github.com/xan105/Achievement-Watcher/releases/download/1.6.8/Achievement.Watcher.Setup.exe'
$checksum32  = 'e2a5d72e98bb5b4225d8925fd20e604330840473a7b6215a0a5f0b7363d0e1bf'

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  silentArgs     = '/SILENT'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs

# no point in auto-updating if software is dead
Disable-ScheduledTask "Achievement Watcher Upgrade Daily"
Remove-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Achievement Watcher.lnk" -Force
