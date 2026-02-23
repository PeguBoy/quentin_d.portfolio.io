#Vérifie si Windows et activé, le cas échéant récupère le numéro de l'erreur avant de le transcrire.
try {
    $product = Get-CimInstance -ClassName SoftwareLicensingProduct -Filter "PartialProductKey IS NOT NULL AND LicenseFamily = 'Windows'" -ErrorAction Stop
    switch ($product.LicenseStatus) {
        0 { Write-Output "Windows 10 n'est pas activé." }
        1 { Write-Output "Windows 10 est activé." }
        2 { Write-Output "Windows 10 est en période de grâce initiale." }
        3 { Write-Output "Windows 10 est en période de grâce supplémentaire." }
        4 { Write-Output "Windows 10 est en période de grâce non authentique." }
        5 { Write-Output "Windows 10 est en mode notification." }
        6 { Write-Output "Windows 10 est en période de grâce étendue." }
        default { Write-Output "Statut d'activation inconnu." }
    }
} catch {
    Write-Output "Erreur lors de la vérification de l'activation : $_"
}
