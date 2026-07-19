$basePath = "c:\Users\Administrator\Documents\GitHub\Departure_Dev"
$files = @(
    "history\states\213-Murmansk.txt",
    "history\states\147-Salla.txt",
    "history\states\215-Eastern Karelia.txt",
    "history\states\929-Oulu.txt",
    "history\states\149-Vaasa.txt",
    "history\states\150-Kuopio.txt",
    "history\states\930-Mikkeli.txt",
    "history\states\927-Hame.txt",
    "history\states\926-Turku.txt",
    "history\states\111-Uusima.txt",
    "history\states\928-Kyme.txt",
    "history\states\195-Leningrad Area.txt",
    "history\states\216-Below Zero.txt"
)

foreach ($file in $files) {
    $fullPath = Join-Path $basePath $file
    $content = [System.IO.File]::ReadAllText($fullPath)
    $pattern = '(history\s*=\s*\{)[ \t]*\r?\n'
    $replacement = "`$1`r`n`t`towner = KLM`r`n`t`tadd_core_of = KLM`r`n"
    $newContent = $content -replace $pattern, $replacement
    [System.IO.File]::WriteAllText($fullPath, $newContent)
    Write-Host "Modified: $file"
}
Write-Host "Done!"