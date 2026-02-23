# Appliquer les réglages visuels pour tous les futurs utilisateurs Windows
# Ce script modifie le profil par défaut situé dans C:\Users\Default

# Chemin vers le fichier de registre du profil par défaut
$defaultUserDat = "C:\Users\Default\NTUSER.DAT"
# Nom de la ruche temporaire dans le registre
$defaultUserHive = "HKU\DefaultHive"

# Vérifie si le fichier NTUSER.DAT du profil par défaut existe
if (Test-Path $defaultUserDat) {

    # Charge la ruche du registre du profil par défaut dans HKU\DefaultHive
    REG LOAD $defaultUserHive $defaultUserDat

    try {
        # Chemin du registre pour les effets visuels
        $visualEffectsPath = "$defaultUserHive\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"

        # Créer la clé si elle n'existe pas
        if (!(Test-Path $visualEffectsPath)) {
            New-Item -Path $visualEffectsPath -Force | Out-Null
        }

        # Définir la valeur pour utiliser des paramètres personnalisés
        Set-ItemProperty -Path $visualEffectsPath -Name 'VisualFXSetting' -Value 3

        # Chemin du registre pour les paramètres d'interface utilisateur
        $uiPath = "$defaultUserHive\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

        # Désactiver tous les effets visuels
        Set-ItemProperty -Path "$defaultUserHive\Control Panel\Desktop" -Name 'UserPreferencesMask' -Value ([byte[]](0x90,0x12,0x01,0x80,0x10,0x00,0x00,0x00))

        # Activer Peek
        Set-ItemProperty -Path $uiPath -Name 'DisablePreviewDesktop' -Value 0

        # Activer les miniatures au lieu des icônes
        Set-ItemProperty -Path $uiPath -Name 'IconsOnly' -Value 0

        # Activer l'animation dans la barre des tâches
        Set-ItemProperty -Path $uiPath -Name 'TaskbarAnimations' -Value 1

        # Activer le lissage des polices d'écran
        Set-ItemProperty -Path "$defaultUserHive\Control Panel\Desktop" -Name 'FontSmoothing' -Value 2

        # Désactiver le contenu des fenêtres pendant leur déplacement
        Set-ItemProperty -Path "$defaultUserHive\Control Panel\Desktop" -Name 'DragFullWindows' -Value 0

        # Désactiver le rectangle de sélection translucide
        Set-ItemProperty -Path $uiPath -Name 'ListviewAlphaSelect' -Value 0

        # Désactiver l'animation des fenêtres lors de leur réduction et agrandissement
        Set-ItemProperty -Path "$defaultUserHive\Control Panel\Desktop\WindowMetrics" -Name 'MinAnimate' -Value 0

        # Désactiver les ombres pour le nom des icônes sur le Bureau
        Set-ItemProperty -Path $uiPath -Name 'ListviewShadow' -Value 0

        Write-Output "✅ Les paramètres de performance visuelle ont été appliqués au profil par défaut."
        Write-Output "➡️ Ils seront automatiquement appliqués à tous les futurs utilisateurs."
    }
    finally {
        # Décharger la ruche du registre après modification
        REG UNLOAD $defaultUserHive
    }

} else {
    Write-Error "❌ Le fichier NTUSER.DAT du profil par défaut est introuvable. Vérifie que le chemin est correct."
}

