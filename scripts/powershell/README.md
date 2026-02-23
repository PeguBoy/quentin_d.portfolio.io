# ⚙️  Scripts PowerShell – Automatisation post-déploiement

## 🧭 Contexte

Dans le cadre de mon alternance, j’ai été amené à automatiser certaines tâches sur les laptops professionnels Windows.
N’étant pas familier avec PowerShell au départ (évoluant principalement sous Linux), j’ai utilisé des outils d’IA comme appui pour construire ces scripts.

## 🎯 Objectifs des scripts

- Accélérer les procédures de post-installation après réinitialisation d’un poste
- Installer les logiciels de base via Chocolatey
- Appliquer des paramètres de configuration courants sur Windows 10/11

## ⚡ Tâches automatisées
- Déploiement de logiciels via Chocolatey (`choco install`)
- Configurations des paramètres système (désactivation de l'envoi d'échantillons, options d'alimentation, etc.)
- Personnalisation de l’environnement utilisateur

## 📁 Fichiers

Tous les scripts sont regroupés dans le dossier [`windows-scripts/`](./windows-scripts/)

## 🖼️ Captures d’écran

| Description | Capture | Script associé |
|-------------|---------|----------------|
| Exécution d’un script PowerShell automatisant l’installation de logiciels via Chocolatey | ![Choco install](../../.captures/scripts/powershell-install-choco.png) | [`choco_soft_install.ps1`](./windows-scripts/choco_soft_install.ps1) |
| Paramètre système désactivé par script : envoi automatique d’échantillons | ![Paramètre échantillon](../../.captures/scripts/powershell-parametres-echantillon.png) | [`disable_sample_send.ps1`](./windows-scripts/disable_sample_send.ps1) |

## ✅ Remarques

- Les scripts ont été testés et ajustés selon les besoins réels de l’entreprise
- L’objectif était fonctionnel, non pédagogique
- Cette démarche m’a permis de mieux comprendre l’environnement Windows côté IT
