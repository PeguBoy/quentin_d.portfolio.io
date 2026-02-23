# Désactiver l'envoi automatique d'échantillons via le registre
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"
$propertyName = "SubmitSamplesConsent"
$propertyValue = 2

# Créer la clé de registre si elle n'existe pas
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Définir la valeur pour désactiver l'envoi automatique d'échantillons
Set-ItemProperty -Path $regPath -Name $propertyName -Value $propertyValue

Write-Host "L'envoi d'échantillons automatiques a été désactivé via le registre."
