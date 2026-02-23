# Désactiver l'optimisation de la distribution via la stratégie de groupe
$policyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
if (!(Test-Path $policyPath)) {
    New-Item -Path $policyPath -Force | Out-Null
}
Set-ItemProperty -Path $policyPath -Name "DODownloadMode" -Value 0 -Type DWord

# Appliquer les changements de stratégie de groupe
gpupdate /force

Write-Output "L'optimisation de la distribution a été désactivée via la stratégie de groupe."
Write-Output "Veuillez redémarrer votre ordinateur pour que les changements prennent effet."
