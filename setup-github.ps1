# Script de Configuration GitHub - Lloyds GO!
# Ce script initialise Git et pousse le code vers GitHub

Write-Host "Configuration GitHub - Lloyds GO!" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Green

# Verifier si Git est installe
try {
    $gitVersion = git --version
    Write-Host "Git detecte: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "Git n'est pas installe. Veuillez l'installer depuis https://git-scm.com/" -ForegroundColor Red
    exit 1
}

# Demander le nom d'utilisateur GitHub
$githubUsername = Read-Host "Entrez votre nom d'utilisateur GitHub"
$repositoryName = Read-Host "Entrez le nom du repository (ex: lloyds-go-app)"

# Initialiser Git si pas deja fait
if (-not (Test-Path ".git")) {
    Write-Host "Initialisation de Git..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial commit - Lloyds GO! Application"
}

# Configurer la branche principale
Write-Host "Configuration de la branche principale..." -ForegroundColor Yellow
git branch -M main

# Ajouter le remote GitHub
Write-Host "Ajout du remote GitHub..." -ForegroundColor Yellow
git remote add origin "https://github.com/$githubUsername/$repositoryName.git"

# Pousser vers GitHub
Write-Host "Poussage vers GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Configuration GitHub reussie!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Prochaines etapes:" -ForegroundColor Cyan
    Write-Host "1. Aller sur https://vercel.com" -ForegroundColor White
    Write-Host "2. S'inscrire avec GitHub" -ForegroundColor White
    Write-Host "3. Importer le repository: $repositoryName" -ForegroundColor White
    Write-Host "4. Configurer les variables d'environnement" -ForegroundColor White
    Write-Host "5. Deployer" -ForegroundColor White
    Write-Host ""
    Write-Host "URL du repository: https://github.com/$githubUsername/$repositoryName" -ForegroundColor Green
} else {
    Write-Host "Erreur lors du poussage vers GitHub" -ForegroundColor Red
    Write-Host "Verifiez que le repository existe sur GitHub" -ForegroundColor Yellow
}
