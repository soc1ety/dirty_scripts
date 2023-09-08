# Creates a .gitkeep file in every subdirectories of current directory

Get-ChildItem -Directory -Recurse | ForEach-Object {
    $gitKeepPath = Join-Path -Path $_.FullName -ChildPath ".gitkeep"
    if (-not (Test-Path -Path $gitKeepPath -PathType Leaf)) {
        New-Item -Path $gitKeepPath -ItemType File -Force
    }
}