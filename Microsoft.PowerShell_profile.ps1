# Add Git's Unix tools to PATH (includes diff, grep, etc.)
$env:PATH += ";C:\Program Files\Git\usr\bin"

# Initialize Starship prompt
Invoke-Expression (&starship init powershell)

# Set Starship config location (adjust path if needed)
$env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

# Yazi configuration
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# Yazi wrapper function
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -ErrorAction SilentlyContinue
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp -Force
}

# Editor variables
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

# eza aliases (modern ls replacement)
Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
function ls { eza --icons $args }
function ll { eza -la --icons $args }
function lt { eza --tree --icons $args }

# nf - Open file in nvim using fzf with bat preview
function nf {
    $file = fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
    if ($file) {
        nvim $file
    }
}

