# Vérifier si le service W32Time est en cours d'exécution avant de l'arrêter
$w32timeService = Get-Service -Name w32time -ErrorAction SilentlyContinue
if ($w32timeService.Status -eq 'Running') {
    Write-Host "Arrêt du service W32Time..."
    net stop w32time
} else {
    Write-Host "Le service W32Time est déjà arrêté."
}

# Désenregistrement du service
Write-Host "Désenregistrement du service W32Time..."
w32tm /unregister
if ($?) {
    Write-Host "Service désenregistré avec succès."
} else {
    Write-Host "Erreur lors du désenregistrement du service."
}

# Réenregistrement du service
Write-Host "Réenregistrement du service W32Time..."
w32tm /register
if ($?) {
    Write-Host "Service réenregistré avec succès."
} else {
    Write-Host "Erreur lors du réenregistrement du service."
}

# Configurer le service en automatique et le démarrer
Set-Service -Name w32time -StartupType Automatic
Start-Service -Name w32time
Write-Host "Service W32Time démarré et configuré en automatique."

# Vérifier si le service a bien démarré
if ((Get-Service -Name w32time).Status -ne "Running") {
    Write-Host "Le service W32Time n'a pas démarré correctement." -ForegroundColor Red
} else {
    Write-Host "Le service W32Time est actif." -ForegroundColor Green
}

# Configurer les serveurs NTP
Write-Host "Configuration des serveurs NTP..."
w32tm /config /manualpeerlist:"pool.ntp.org, time.google.com, time.windows.com,0x8" /syncfromflags:manual /reliable:YES /update

# Forcer la synchronisation
Write-Host "Forçage de la synchronisation..."
w32tm /resync /force

# Vérifier l'état après exécution
Write-Host "Vérification du statut de la synchronisation..."
w32tm /query /status

# Activation de la gestion automatique du fuseau horaire
Write-Host "Activation de la gestion automatique du fuseau horaire..." -ForegroundColor Cyan

# Démarrer le service de mise à jour automatique du fuseau horaire
Set-Service -Name tzautoupdate -StartupType Automatic
Start-Service -Name tzautoupdate

# Modifier la clé de registre pour activer l'option
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "Start" -Value 2

# Validation de la modification de la clé de registre
$tzUpdateService = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "Start"
if ($tzUpdateService.Start -eq 2) {
    Write-Host "La mise à jour de la clé de registre a été appliquée avec succès." -ForegroundColor Green
} else {
    Write-Host "Erreur lors de la mise à jour de la clé de registre." -ForegroundColor Red
}

# Vérifier l'état du service tzautoupdate
if ((Get-Service -Name tzautoupdate).Status -ne "Running") {
    Write-Host "Le service de mise à jour automatique du fuseau horaire n'a pas démarré correctement." -ForegroundColor Red
} else {
    Write-Host "Le fuseau horaire sera maintenant ajusté automatiquement." -ForegroundColor Green
}
