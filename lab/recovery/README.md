# Mini Workshop – Récupération de données

## Objectif
Monter une image disque `.qcow2` et récupérer des données supprimées sous Linux.

## Outils utilisés
- `losetup` / `mount` : pour le montage en loop device
- `photorec` : pour la récupération de fichiers supprimés

## Étapes réalisées
1. Association de l’image à un loop device
2. Identification du type de partition et montage
3. Récupération partielle des données supprimées

## 🖼️ Preuves – Récupération de données

| Étape | Capture |
|-------|---------|
| Montage de l’image `.qcow2` avec `losetup` | ![losetup](../../.captures/recovery/losetup.png) |
| Vérification du périphérique `/dev/loop0` | ![lsblk](../../.captures/recovery/lsblk.png) |
| Récupération de données avec `PhotoRec` | ![PhotoRec](../../.captures/recovery/recovery.png) |
| Liste des fichiers retrouvés | ![Résultat fichiers récupérés](../../.captures/recovery/resultat.png) |
