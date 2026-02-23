# Désactiver l'hibernation (désactive également la veille hybride)
Write-Output "Désactivation de l'hibernation..."
powercfg.exe -h off

# Modifier le registre pour désactiver le démarrage rapide
Write-Output "Désactivation du démarrage rapide..."
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
$regName = "HiberbootEnabled"

if (Test-Path $regPath) {
    Set-ItemProperty -Path $regPath -Name $regName -Value 0
    Write-Output "Démarrage rapide désactivé avec succès."
} else {
    Write-Output "Impossible de trouver le chemin du registre. Vérifiez votre système."
}

# Confirmation à l'utilisateur
Write-Output "La veille hybride et le démarrage rapide ont été désactivés. Redémarrez votre ordinateur pour appliquer les modifications."
