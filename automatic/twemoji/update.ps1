import-module au

$releases = 'https://github.com/eosrei/twemoji-color-font/releases'

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

    $re  = "TwitterColorEmoji-SVGinOT-Win-.+.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = ($url -split '/' | select -Last 1 -Skip 1) -replace 'v',''
    $url32 = 'https://github.com' + $url

    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
