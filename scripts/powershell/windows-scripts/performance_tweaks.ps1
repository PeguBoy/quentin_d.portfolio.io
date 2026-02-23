# Chemin du registre pour les effets visuels
$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'

# Créer la clé si elle n'existe pas
if (!(Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Définir la valeur pour utiliser des paramètres personnalisés
Set-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 3

# Chemin du registre pour les paramètres d'interface utilisateur
$uiPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'

# Désactiver tous les effets visuels
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -Value ([byte[]](0x90,0x12,0x01,0x80,0x10,0x00,0x00,0x00))

# Activer Peek
Set-ItemProperty -Path $uiPath -Name 'DisablePreviewDesktop' -Value 0

# Activer les miniatures au lieu des icônes
Set-ItemProperty -Path $uiPath -Name 'IconsOnly' -Value 0

# Activer l'animation dans la barre des tâches
Set-ItemProperty -Path $uiPath -Name 'TaskbarAnimations' -Value 1

# Activer le lissage des polices d'écran
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'FontSmoothing' -Value 2

# Désactiver le contenu des fenêtres pendant leur déplacement
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'DragFullWindows' -Value 0

# Désactiver le rectangle de sélection translucide
Set-ItemProperty -Path $uiPath -Name 'ListviewAlphaSelect' -Value 0

# Désactiver l'animation des fenêtres lors de leur réduction et agrandissement
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -Value 0

# Désactiver les ombres pour le nom des icônes sur le Bureau
Set-ItemProperty -Path $uiPath -Name 'ListviewShadow' -Value 0

Write-Output "Les paramètres de performance visuelle ont été mis à jour. Seuls Peek, les miniatures de la barre des tâches, l'animation de la barre des tâches et le lissage des polices sont activés. Tous les autres effets visuels sont désactivés."
