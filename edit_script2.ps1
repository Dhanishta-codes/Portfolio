# Read the file
$content = [System.IO.File]::ReadAllText('C:\ajj\index.html')

# Check what we need to fix
$log = @()
$log += "Original file size: $($content.Length)"

# Check Edit 1
if ($content -match 'font-weight:700') {
    $log += "Edit 1: SUCCESS"
} else {
    $log += "Edit 1: FAILED"
}

# Check Edit 2
if ($content -match 'nav-logo') {
    $log += "Edit 2: SUCCESS"
} else {
    $log += "Edit 2: FAILED"
}

# Check Edit 3
if ($content -match 'hero-intro') {
    $log += "Edit 3: FAILED - hero-intro still exists"
    
    # Find and remove the hero-intro div
    $pattern = '<div class="hero-intro">\s*<span class="hero-subtitle">– Product & Strategy</span>\s*</div>'
    if ($content -match $pattern) {
        $log += "Pattern matched, attempting removal"
        $content = $content -replace $pattern, ''
    } else {
        $log += "Pattern did not match, trying different approach"
        # Try finding the exact location
        $startIdx = $content.IndexOf('<div class="hero-intro">')
        if ($startIdx -ge 0) {
            $log += "Found at index: $startIdx"
            $endIdx = $content.IndexOf('</div>', $startIdx)
            if ($endIdx -ge 0) {
                $log += "End found at index: $endIdx"
                $newContent = $content.Substring(0, $startIdx) + $content.Substring($endIdx + 6)
                $content = $newContent
            }
        }
    }
} else {
    $log += "Edit 3: SUCCESS"
}

# Check Edit 4
if ($content -match '\.hero-intro\{') {
    $log += "Edit 4: FAILED - CSS rules still exist"
    # Remove the CSS rules with a more flexible pattern
    $content = $content -replace '\.hero-intro\{[^}]*\}', ''
    $content = $content -replace '\.hero-name\{[^}]*\}', ''
    $content = $content -replace '\.hero-subtitle\{[^}]*\}', ''
} else {
    $log += "Edit 4: SUCCESS"
}

# Save the file
[System.IO.File]::WriteAllText('C:\ajj\index.html', $content)
$log += "Final file size: $($content.Length)"
$log += "File saved!"

# Write log
$log | Out-File 'C:\ajj\edit_log.txt'
