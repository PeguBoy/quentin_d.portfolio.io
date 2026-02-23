# Vérifier le nom actuel du laptop
$currentComputerName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
Write-Host "Nom actuel du laptop : $currentComputerName"

# Demander à l'utilisateur de saisir le nouveau nom du laptop
$newComputerName = Read-Host "Veuillez saisir le nouveau nom du laptop"

# Renommer le laptop
Write-Host "Renommage du laptop en cours..."
Rename-Computer -NewName $newComputerName -Force
