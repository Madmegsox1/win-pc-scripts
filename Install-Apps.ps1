$localAppDataPath = $env:LOCALAPPDATA

Write-Host "Installing windows debloat"

git clone "https://github.com/LeDragoX/Win-Debloat-Tools.git"

Write-Host "Installed windows debloat"

Write-Host "Installing Gradle"

curl -o gradle.zip https://services.gradle.org/distributions/gradle-8.8-bin.zip

mkdir ./gradle

$gradlePath = [IO.Path]::GetFullPath("./gradle")

Expand-Archive -Path ./gradle.zip -DestinationPath $gradlePath

Set-Path $gradlePath

Write-Host "Installed Gradle"

Refresh-Path

Write-Host "Installing Rust analyser"

curl -o rust-analyser.zip https://github.com/rust-lang/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-pc-windows-msvc.zip

mkdir ./rust-analyser

$rustPath = [IO.Path]::GetFullPath("./rust-analyser")

Expand-Archive -Path ./rust-analyser.zip -DestinationPath $rustPath

Set-Path $rustPath

Refresh-Path

Write-Host "Installed Rust analyser"

Write-Host "Installing Apps"
winget install "Oracle.JDK.20"
winget install "OpenJS.NodeJS"
winget install "Python.Python.3.8"
winget install "Docker.DockerDesktop"
winget install "Microsoft.NuGet"
winget install "Microsoft.DotNet.SDK.8"

winget install "7zip.7zip"
winget install "Insecure.Nmap"
winget install "JanDeDobbeleer.OhMyPosh"
winget install "JetBrains.Toolbox"
winget install "Neovim.Neovim"
winget install "Obsidian.Obsidian"
winget install "Mozilla.Firefox"
winget install "Spotify.Spotify"
winget install "Valve.Steam"
winget install "Oracle.VirtualBox"
winget install "ProtonTechnologies.ProtonVPN"
winget install "WiresharkFoundation.Wireshark"
winget install "dnSpyEx.dnSpy"

Write-Host "Installed Apps" 

$ohmyposh = Set-Path Join-Path -Path $localAppDataPath -ChildPath "Programs\oh-my-posh\bin"

Set-Path $ohmyposh

Refresh-Path

Write-Host "Adding dotnet ls"

dotnet tool install --global csharp-ls

Write-Host "Added dotnet ls"

function Set-Path {
    param($newPath)
    $currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
    $newPath = $currentPath + ";" + $newPath
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
}

function Refresh-Path {

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
                ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")
}