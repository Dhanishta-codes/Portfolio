# Read the file
$content = [System.IO.File]::ReadAllText('C:\ajj\index.html')
$originalLength = $content.Length
Write-Host "File length: $originalLength"

# Edit 1: Change font-weight:500 to font-weight:700 in .nav-name
Write-Host "Starting Edit 1..."
$pattern1 = '(\.nav-name\{font-family:var\(--font-body\);font-size:20px;font-weight:)500'
$replacement1 = '${1}700'
$content = $content -replace $pattern1, $replacement1

if ($content -match 'font-weight:700') {
    Write-Host "Edit 1: SUCCESS"
} else {
    Write-Host "Edit 1: FAILED"
}

# Edit 2: Replace the nav-name anchor with new div structure
Write-Host "Starting Edit 2..."
$oldNav = '<a href="index.html" class="nav-name">Dhanishta</a>'
$newNav = '<div class="nav-logo">' + "`r`n" + '    <a href="index.html" class="nav-name">Dhanishta<span class="nav-subtitle">– Product & Strategy</span></a>' + "`r`n" + '  </div>'
$content = $content -replace [regex]::Escape($oldNav), $newNav

if ($content -match 'nav-logo') {
    Write-Host "Edit 2: SUCCESS"
} else {
    Write-Host "Edit 2: FAILED"
}

# Edit 3: Remove the hero-intro div
Write-Host "Starting Edit 3..."
$heroIntroPattern = '<div class="hero-intro">\s*<span class="hero-subtitle">– Product & Strategy</span>\s*</div>'
$content = $content -replace $heroIntroPattern, ''

if ($content -notmatch 'hero-intro') {
    Write-Host "Edit 3: SUCCESS"
} else {
    Write-Host "Edit 3: FAILED"
}

# Edit 4: Remove the three CSS rules
Write-Host "Starting Edit 4..."
$cssPattern = '\.hero-intro\{[^}]+\}\.hero-name\{[^}]+\}\.hero-subtitle\{[^}]+\}'
$content = $content -replace $cssPattern, ''

Write-Host "Edit 4: Completed"

# Save the file
[System.IO.File]::WriteAllText('C:\ajj\index.html', $content)
Write-Host "File saved successfully!"
