# HackedAnimation.ps1 - Hollywood-style Hacking Scene (Fixed Version)
# Save as: HackedAnimation.ps1

function Show-MatrixRain {
    $chars = "01ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$%&*#@!~"
    $columns = @{}
    $width = [Console]::WindowWidth
    $height = [Console]::WindowHeight - 2
    
    # Initialize columns
    1..$width | ForEach-Object { $columns[$_] = @{position = Get-Random -Maximum $height; speed = Get-Random -Minimum 1 -Maximum 5} }
    
    $startTime = Get-Date
    $duration = 5  # seconds
    
    while ((Get-Date) - $startTime -lt [TimeSpan]::FromSeconds($duration)) {
        $output = ""
        
        for ($y = 0; $y -lt $height; $y++) {
            for ($x = 1; $x -le $width; $x++) {
                if ($columns[$x].position -eq $y) {
                    $char = $chars[(Get-Random -Maximum $chars.Length)]
                    # Make the head of the stream bright green
                    Write-Host $char -NoNewline -ForegroundColor Green
                } elseif ($columns[$x].position -gt $y -and ($columns[$x].position - $y) -lt 10) {
                    $char = $chars[(Get-Random -Maximum $chars.Length)]
                    # Make the tail darker green
                    Write-Host $char -NoNewline -ForegroundColor DarkGreen
                } else {
                    Write-Host " " -NoNewline
                }
            }
            Write-Host ""
        }
        
        # Update column positions
        foreach ($col in $columns.Keys) {
            $columns[$col].position += $columns[$col].speed
            if ($columns[$col].position -gt $height + 10) {
                $columns[$col].position = 0
                $columns[$col].speed = Get-Random -Minimum 1 -Maximum 5
            }
        }
        
        Start-Sleep -Milliseconds 50
        Clear-Host
    }
}

function Show-HackingMessages {
    $messages = @(
        "INITIATING CYBER ATTACK PROTOCOL...",
        "BREACHING FIREWALL SECURITY...",
        "ACCESSING MAINFRAME DATABASE...",
        "DOWNLOADING CLASSIFIED DATA...",
        "ENCRYPTING SYSTEM FILES...",
        "INSTALLING BACKDOOR ACCESS...",
        "SCANNING FOR VULNERABILITIES...",
        "EXECUTING EXPLOIT CODE...",
        "ELEVATING PRIVILEGES...",
        "ESTABLISHING REMOTE CONNECTION..."
    )
    
    foreach ($msg in $messages) {
        Clear-Host
        Write-Host "`n`n`n" -NoNewline
        Write-Host "    " -NoNewline
        for ($i = 0; $i -lt $msg.Length; $i++) {
            Write-Host $msg[$i] -NoNewline -ForegroundColor Red
            Start-Sleep -Milliseconds 30
        }
        Write-Host " [" -NoNewline -ForegroundColor Yellow
        Write-Host "SUCCESS" -NoNewline -ForegroundColor Green
        Write-Host "]" -ForegroundColor Yellow
        
        # Flash effect
        for ($i = 0; $i -lt 3; $i++) {
            Start-Sleep -Milliseconds 100
        }
        
        Start-Sleep -Milliseconds 500
    }
}

function Show-WarningSymbols {
    $symbols = @("!", "X", "#", "$", "%", "&")
    $colors = @("Red", "Yellow", "Magenta", "Cyan", "White", "Green")
    
    for ($cycle = 0; $cycle -lt 10; $cycle++) {
        Clear-Host
        $symbol = $symbols[($cycle % $symbols.Length)]
        $color = $colors[($cycle % $colors.Length)]
        
        Write-Host "`n`n`n" -NoNewline
        Write-Host "    " -NoNewline
        for ($i = 0; $i -lt 20; $i++) {
            Write-Host "$symbol " -NoNewline -ForegroundColor $color
        }
        Write-Host ""
        Write-Host "    " -NoNewline
        for ($i = 0; $i -lt 20; $i++) {
            Write-Host "$symbol " -NoNewline -ForegroundColor $color
        }
        Write-Host ""
        Write-Host "    " -NoNewline
        for ($i = 0; $i -lt 20; $i++) {
            Write-Host "$symbol " -NoNewline -ForegroundColor $color
        }
        
        Start-Sleep -Milliseconds 200
    }
}

function Show-FakeIPAddresses {
    $fakeIPs = @(
        "192.168.1.105 - CHINA",
        "10.0.0.47 - RUSSIA",
        "172.16.254.12 - NORTH KOREA",
        "203.0.113.89 - IRAN",
        "198.51.100.23 - UNKNOWN",
        "169.254.169.254 - INTERNAL SERVER"
    )
    
    Clear-Host
    Write-Host "`n`n`n" -NoNewline
    Write-Host "    TRACING ATTACK ORIGIN..." -ForegroundColor Yellow
    Write-Host ""
    
    foreach ($ip in $fakeIPs) {
        Write-Host "    > " -NoNewline -ForegroundColor Red
        Write-Host "CONNECTION FROM: " -NoNewline -ForegroundColor White
        Write-Host $ip -ForegroundColor Cyan
        Start-Sleep -Milliseconds 400
    }
}

function Show-Countdown {
    Write-Host "`n`n`n" -NoNewline
    Write-Host "    SYSTEM COMPROMISE IN: " -NoNewline -ForegroundColor Yellow
    
    for ($i = 5; $i -ge 1; $i--) {
        Write-Host "$i " -NoNewline -ForegroundColor Red
        Start-Sleep -Milliseconds 800
    }
    
    Write-Host "0" -ForegroundColor Red
    Start-Sleep -Milliseconds 500
}

function Show-FinalWarning {
    $messages = @(
        "ACCESS GRANTED",
        "SYSTEM BREACHED",
        "DATA COMPROMISED",
        "YOU'VE BEEN HACKED"
    )
    
    for ($flash = 0; $flash -lt 8; $flash++) {
        Clear-Host
        if ($flash % 2 -eq 0) {
            Write-Host "`n`n`n`n`n" -NoNewline
            Write-Host "          ====================================" -ForegroundColor Red
            Write-Host "          =      SYSTEM BREACH DETECTED     =" -ForegroundColor Red
            Write-Host "          ====================================" -ForegroundColor Red
            Write-Host ""
            Write-Host "          =      YOU'VE BEEN HACKED!        =" -ForegroundColor Red
            Write-Host "          ====================================" -ForegroundColor Red
        } else {
            Write-Host "`n`n`n`n`n" -NoNewline
            Write-Host "    " -NoNewline
            Write-Host $messages[(Get-Random -Maximum $messages.Length)] -ForegroundColor Green
        }
        Start-Sleep -Milliseconds 300
    }
    
    # Final message with typewriter effect
    $finalMessage = "WARNING: YOUR SYSTEM SECURITY HAS BEEN COMPROMISED!"
    Clear-Host
    Write-Host "`n`n`n`n    " -NoNewline
    for ($i = 0; $i -lt $finalMessage.Length; $i++) {
        Write-Host $finalMessage[$i] -NoNewline -ForegroundColor Red
        Start-Sleep -Milliseconds 50
    }
    
    Write-Host "`n`n    " -NoNewline
    Write-Host "This is a simulation. Your system is safe." -ForegroundColor Green
}

function Show-HackerArt {
    $art = @"
    
          _   _             _             
         | | | |           | |            
         | |_| | __ _  ___ | | _____ _ __ 
         |  _  |/ _' |/ _ \| |/ / _ \ '__|
         | | | | (_| | (_) |   <  __/ |   
         \_| |_/\__,_|\___/|_|\_\___|_|   
    
          Hollywood-Style Hacking Simulation
    
"@
    
    Write-Host $art -ForegroundColor Cyan
}

# Main execution sequence
try {
    # Set console for best effect
    $originalTitle = $Host.UI.RawUI.WindowTitle
    $Host.UI.RawUI.WindowTitle = "SECURITY BREACH SIMULATION"
    
    Write-Host "Starting security breach simulation..." -ForegroundColor Yellow
    Write-Host "Press Ctrl+C at any time to exit" -ForegroundColor Gray
    Start-Sleep -Seconds 2
    
    # Animation sequence
    Show-MatrixRain
    Show-HackingMessages
    Show-WarningSymbols
    Show-FakeIPAddresses
    Show-Countdown
    Show-FinalWarning
    
    Write-Host "`n`n`n    Press any key to reveal the hacker..." -ForegroundColor DarkYellow
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
    
    Clear-Host
    Show-HackerArt
    Write-Host "`n`n    Just kidding! This was a harmless PowerShell animation." -ForegroundColor Green
    Write-Host "    Your system is completely safe." -ForegroundColor Green
    
    # Restore original title
    $Host.UI.RawUI.WindowTitle = $originalTitle
}
catch {
    Write-Host "`nAnimation interrupted!" -ForegroundColor Red
}
finally {
    Write-Host "`nSimulation ended. Have a great day!" -ForegroundColor Cyan
}