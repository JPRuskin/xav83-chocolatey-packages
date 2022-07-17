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

    $re  = "dosbox-x-win(32|64)-.+-setup.exe$"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = $url[0] -split '/' -split '-' -replace 'v','' | select -First 1 -Skip 8
    $url32 = 'https://github.com' + $url[0]

    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
