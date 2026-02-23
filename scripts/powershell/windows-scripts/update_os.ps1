# Installer le module PSWindowsUpdate s'il n'est pas déjà présent
if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Install-Module -Name PSWindowsUpdate -Force
}

# Importer le module PSWindowsUpdate
Import-Module PSWindowsUpdate

# Rechercher toutes les mises à jour, y compris les facultatives
$updates = Get-WindowsUpdate -MicrosoftUpdate

# Initialiser la barre de progression
$totalUpdates = $updates.Count
$currentUpdate = 0

# Installer les mises à jour avec une barre de progression
foreach ($update in $updates) {
    $currentUpdate++
    $percentComplete = ($currentUpdate / $totalUpdates) * 100
    
    Write-Progress -Activity "Installation des mises à jour Windows" -Status "Progression" -PercentComplete $percentComplete -CurrentOperation "Installation de $($update.Title)"
    
    Install-WindowsUpdate -KBArticleID $update.KBArticleID -AcceptAll -AutoReboot
}

Write-Progress -Activity "Installation des mises à jour Windows" -Completed

Write-Output "Les mises à jour Windows, y compris les facultatives, ont été installées. Le système redémarrera automatiquement si nécessaire."
