import-module au

$releases = 'https://github.com/joncampbell123/dosbox-x/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "dosbox-x-windows-.+-setup.exe$"

    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '/' -split '-' | select -First 1 -Skip 8 | tr -d v
    $url32 = 'https://github.com' + $url

    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
