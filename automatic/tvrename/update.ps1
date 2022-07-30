import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $releases = 'https://github.com/TV-Rename/tvrename/releases'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "TVRename-[0-9]+\.[0-9]+\.[0-9]+.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '/' | select -Last 1 -Skip 1
    $url = 'https://github.com' + $url

    $Latest = @{ URL32 = $url; Version = $version }
    return $Latest
}

update -ChecksumFor 32 -Force:$Force
