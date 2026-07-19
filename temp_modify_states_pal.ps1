$basePath = "c:\Users\Administrator\Documents\GitHub\Departure_Dev"
$files = @(
    "history\states\812-Tallinn.txt",
    "history\states\813-Rakvere.txt",
    "history\states\208-Pskov.txt",
    "history\states\811-Saaremaa.txt",
    "history\states\13-Estonia.txt",
    "history\states\191-Tartu.txt",
    "history\states\209-Smolensk.txt",
    "history\states\263-Veliky Novogrod.txt",
    "history\states\190-Kurzeme.txt",
    "history\states\808-Riga.txt",
    "history\states\12-Latvia.txt",
    "history\states\809-Latgale.txt",
    "history\states\810-Zemgale.txt",
    "history\states\210-Bryansk.txt",
    "history\states\246-Rzhev.txt",
    "history\states\189-Kaunas.txt",
    "history\states\815-Aukstaitija.txt",
    "history\states\188-Memel.txt",
    "history\states\11-Kaunas.txt",
    "history\states\96-Wilejka.txt",
    "history\states\207-Viciebsk.txt",
    "history\states\242-Smolensk.txt",
    "history\states\763-Konigsberg.txt",
    "history\states\814-Suduva.txt",
    "history\states\784-Ermland-Masuren.txt",
    "history\states\206-Minsk.txt",
    "history\states\243-Roslavl.txt",
    "history\states\97-Bialystok.txt",
    "history\states\95-Nowogrodek.txt",
    "history\states\204-Brest.txt",
    "history\states\241-Pochep.txt",
    "history\states\224-Bryansk.txt",
    "history\states\10-Poland.txt",
    "history\states\94-Polesie.txt",
    "history\states\194-Pinsk Marches.txt",
    "history\states\92-Lublin.txt",
    "history\states\93-Volhynian.txt",
    "history\states\201-Zhytomyr.txt",
    "history\states\193-Kiev.txt",
    "history\states\88-Kielce.txt",
    "history\states\91-Tarnopol.txt",
    "history\states\202-Western Kiev.txt"
)

foreach ($file in $files) {
    $fullPath = Join-Path $basePath $file
    if (-not (Test-Path $fullPath)) {
        Write-Host "NOT FOUND: $file"
        continue
    }
    $content = [System.IO.File]::ReadAllText($fullPath)
    $pattern = '(history\s*=\s*\{)[ \t]*\r?\n'
    $replacement = "`$1`r`n`t`towner = PAL`r`n`t`tadd_core_of = PAL`r`n"
    $newContent = $content -replace $pattern, $replacement
    [System.IO.File]::WriteAllText($fullPath, $newContent)
    Write-Host "Modified: $file"
}
Write-Host "Done!"