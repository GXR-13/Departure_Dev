$basePath = "c:\Users\Administrator\Documents\GitHub\Departure_Dev"
$files = @(
    "history\states\909-South Schleswig.txt",
    "history\states\58-Schleswig - Holstein.txt",
    "history\states\61-Mecklenburg.txt",
    "history\states\62-Pommern.txt",
    "history\states\63-WestPrussen.txt",
    "history\states\56-Weser-Ems.txt",
    "history\states\59-Ost - Hannover.txt",
    "history\states\64-Brandenburg.txt",
    "history\states\68-Wartheland.txt",
    "history\states\86-Poznan.txt",
    "history\states\57-Westfalen.txt",
    "history\states\60-Sud-Hannover.txt",
    "history\states\65-Sachsen.txt",
    "history\states\51-Moselland.txt",
    "history\states\55-Nassau.txt",
    "history\states\54-Bayreuth.txt",
    "history\states\42-Rhineland.txt",
    "history\states\8-Luxemburg.txt",
    "history\states\36-Friesland.txt"
)

foreach ($file in $files) {
    $fullPath = Join-Path $basePath $file
    if (-not (Test-Path $fullPath)) {
        Write-Host "NOT FOUND: $file"
        continue
    }
    $content = [System.IO.File]::ReadAllText($fullPath)
    if ($content -match 'owner\s*=') {
        Write-Host "SKIPPED (has owner): $file"
        continue
    }
    if ($content -match 'history\s*=\s*\{') {
        $pattern = '(history\s*=\s*\{)[ \t]*\r?\n'
        $replacement = "`$1`r`n`t`towner = GER`r`n`t`tadd_core_of = GER`r`n"
        $newContent = $content -replace $pattern, $replacement
        [System.IO.File]::WriteAllText($fullPath, $newContent)
        Write-Host "Modified: $file"
    } else {
        Write-Host "NO history block: $file"
    }
}
Write-Host "Done!"