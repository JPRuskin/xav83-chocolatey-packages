import-module au

$releases = 'https://github.com/joncampbell123/dosbox-x/releases'

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

    $re  = "dosbox-x-windows-.+-.+-windows.zip$"

    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '/' -split '-' | select -First 1 -Skip 8 | tr -d v
    $url64 = 'https://github.com' + $url

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor 64
