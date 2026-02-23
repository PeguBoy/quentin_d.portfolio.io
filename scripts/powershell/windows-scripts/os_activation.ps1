# Fonction pour vérifier l'état d'activation de Windows
function Get-ActivationStatus {
    try {
        $product = Get-CimInstance -ClassName SoftwareLicensingProduct -Filter "PartialProductKey IS NOT NULL AND LicenseFamily = 'Windows'" -ErrorAction Stop
        return $product.LicenseStatus
    } catch {
        Write-Output "Erreur lors de la vérification de l'activation : $_"
        return -1
    }
}

# Vérification initiale de l'état d'activation
$initialStatus = Get-ActivationStatus

if ($initialStatus -ne 1) {
    Write-Output "Windows n'est pas activé. Tentative d'activation..."
    
    # Tentative d'activation
    try {
        $result = Start-Process "cscript.exe" -ArgumentList "//NoLogo $env:windir\system32\slmgr.vbs /ato" -Wait -NoNewWindow -PassThru
        if ($result.ExitCode -ne 0) {
            Write-Output "Échec de l'activation. Code de sortie : $($result.ExitCode)"
        } else {
            Write-Output "Commande d'activation exécutée. Vérification du nouveau statut..."
        }
    } catch {
        Write-Output "Erreur lors de l'exécution de la commande d'activation : $_"
    }

    # Vérification du nouveau statut après tentative d'activation
    $newStatus = Get-ActivationStatus

    switch ($newStatus) {
        0 { Write-Output "L'activation a échoué. Windows n'est toujours pas activé." }
        1 { Write-Output "L'activation a réussi. Windows est maintenant activé." }
        2 { Write-Output "Windows est en période de grâce initiale." }
        3 { Write-Output "Windows est en période de grâce supplémentaire." }
        4 { Write-Output "Windows est en période de grâce non authentique." }
        5 { Write-Output "Windows est en mode notification." }
        6 { Write-Output "Windows est en période de grâce étendue." }
        default { Write-Output "Statut d'activation inconnu après tentative." }
    }
} else {
    Write-Output "Windows est déjà activé. Aucune action nécessaire."
}
