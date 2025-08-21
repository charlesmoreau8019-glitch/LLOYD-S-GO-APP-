# 🚀 Script Simple - Configuration GitHub pour Lloyds GO!

Write-Host "🚀 Configuration GitHub pour Lloyds GO!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

# Étape 1: Vérifier Git
Write-Host "`n📋 Étape 1: Vérification de Git..." -ForegroundColor Yellow

$gitVersion = git --version 2>$null
if ($gitVersion) {
    Write-Host "✅ Git est installé: $gitVersion" -ForegroundColor Green
} else {
    Write-Host "❌ Git n'est pas installé." -ForegroundColor Red
    Write-Host "`n📥 Veuillez installer Git:" -ForegroundColor Yellow
    Write-Host "1. Allez sur: https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host "2. Téléchargez et installez Git" -ForegroundColor Cyan
    Write-Host "3. Redémarrez PowerShell" -ForegroundColor Cyan
    Write-Host "4. Relancez ce script" -ForegroundColor Cyan
    Read-Host "Appuyez sur Entrée pour continuer"
    exit
}

# Étape 2: Configuration Git
Write-Host "`n📋 Étape 2: Configuration Git..." -ForegroundColor Yellow

$userName = Read-Host "Entrez votre nom complet (ex: Jean Dupont)"
$userEmail = Read-Host "Entrez votre email (ex: jean.dupont@email.com)"

Write-Host "🔧 Configuration de Git..." -ForegroundColor Cyan
git config --global user.name $userName
git config --global user.email $userEmail

Write-Host "✅ Git configuré avec: $userName - $userEmail" -ForegroundColor Green

# Étape 3: Vérifier le repository local
Write-Host "`n📋 Étape 3: Vérification du repository local..." -ForegroundColor Yellow

$currentDir = Get-Location
Write-Host "📁 Répertoire actuel: $currentDir" -ForegroundColor Cyan

if (Test-Path ".git") {
    Write-Host "✅ Repository Git déjà initialisé" -ForegroundColor Green
} else {
    Write-Host "🔧 Initialisation du repository Git..." -ForegroundColor Cyan
    git init
    Write-Host "✅ Repository Git initialisé" -ForegroundColor Green
}

# Étape 4: Ajouter les fichiers
Write-Host "`n📋 Étape 4: Ajout des fichiers..." -ForegroundColor Yellow

Write-Host "📊 Statut actuel:" -ForegroundColor Cyan
git status

Write-Host "`n📁 Ajout de tous les fichiers..." -ForegroundColor Cyan
git add .

Write-Host "💾 Création du commit initial..." -ForegroundColor Cyan
git commit -m "Initial commit - Lloyds GO! Application complète"

Write-Host "✅ Fichiers ajoutés et commités!" -ForegroundColor Green

# Étape 5: Configuration GitHub
Write-Host "`n📋 Étape 5: Configuration GitHub..." -ForegroundColor Yellow

Write-Host "🌐 Création du repository GitHub:" -ForegroundColor Cyan
Write-Host "1. Allez sur: https://github.com" -ForegroundColor Yellow
Write-Host "2. Connectez-vous à votre compte" -ForegroundColor Yellow
Write-Host "3. Cliquez sur '+' puis 'New repository'" -ForegroundColor Yellow
Write-Host "4. Nom: lloyds-go-app" -ForegroundColor Yellow
Write-Host "5. Description: Application bancaire et crypto moderne" -ForegroundColor Yellow
Write-Host "6. Choisissez 'Public'" -ForegroundColor Yellow
Write-Host "7. NE cochez PAS 'Add a README file'" -ForegroundColor Yellow
Write-Host "8. Cliquez 'Create repository'" -ForegroundColor Yellow

$githubUsername = Read-Host "`nEntrez votre nom d'utilisateur GitHub"
$repositoryUrl = "https://github.com/$githubUsername/lloyds-go-app.git"

Write-Host "🔗 URL du repository: $repositoryUrl" -ForegroundColor Cyan

# Étape 6: Connexion au repository
Write-Host "`n📋 Étape 6: Connexion au repository GitHub..." -ForegroundColor Yellow

Write-Host "🔧 Ajout du remote origin..." -ForegroundColor Cyan
git remote add origin $repositoryUrl

Write-Host "🌿 Définition de la branche principale..." -ForegroundColor Cyan
git branch -M main

Write-Host "📤 Poussée vers GitHub..." -ForegroundColor Cyan
Write-Host "⚠️  Vous devrez vous authentifier..." -ForegroundColor Yellow

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Fichiers poussés vers GitHub avec succès!" -ForegroundColor Green
} else {
    Write-Host "❌ Erreur lors de la poussée." -ForegroundColor Red
    Write-Host "Vérifiez votre nom d'utilisateur et mot de passe GitHub." -ForegroundColor Yellow
}

# Étape 7: Vérification finale
Write-Host "`n📋 Étape 7: Vérification finale..." -ForegroundColor Yellow

Write-Host "✅ Configuration terminée!" -ForegroundColor Green
Write-Host "`n🌐 Votre repository est disponible sur:" -ForegroundColor Cyan
Write-Host "$repositoryUrl" -ForegroundColor Green

Write-Host "`n📋 Prochaines étapes:" -ForegroundColor Yellow
Write-Host "1. Vérifiez votre repository sur GitHub" -ForegroundColor Cyan
Write-Host "2. Connectez Vercel pour le déploiement" -ForegroundColor Cyan
Write-Host "3. Configurez les variables d'environnement" -ForegroundColor Cyan

Write-Host "`n🚀 Lloyds GO! est maintenant sur GitHub!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
