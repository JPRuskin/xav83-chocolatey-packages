import-module au

$releases = 'https://github.com/portapps/signal-portable/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "signal-portable-win64-.+-setup.exe"

    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '/' | select -Last 1 -Skip 1) -split '-' | select -First 1

    $url64 = 'https://github.com' + $url

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor 64
