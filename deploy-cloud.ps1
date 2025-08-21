# Script de Deploiement Cloud Netlify - Lloyds GO!
# Ce script automatise le deploiement de l'application sur Netlify

Write-Host "Deploiement Cloud Netlify - Lloyds GO!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Verifier si Node.js est installe
try {
    $nodeVersion = node --version
    Write-Host "Node.js detecte: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "Node.js n'est pas installe. Veuillez l'installer depuis https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Verifier si Netlify CLI est installe
try {
    $netlifyVersion = netlify --version
    Write-Host "Netlify CLI detecte: $netlifyVersion" -ForegroundColor Green
} catch {
    Write-Host "Installation de Netlify CLI..." -ForegroundColor Yellow
    npm install -g netlify-cli
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de l'installation de Netlify CLI" -ForegroundColor Red
        exit 1
    }
}

# Installer les dependances
Write-Host "Installation des dependances..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erreur lors de l'installation des dependances" -ForegroundColor Red
    exit 1
}

# Verifier si l'utilisateur est connecte a Netlify
Write-Host "Verification de la connexion Netlify..." -ForegroundColor Yellow
try {
    netlify status
} catch {
    Write-Host "Connexion a Netlify requise..." -ForegroundColor Yellow
    netlify login
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de la connexion a Netlify" -ForegroundColor Red
        exit 1
    }
}

# Creer le fichier .env s'il n'existe pas
if (-not (Test-Path ".env")) {
    Write-Host "Creation du fichier .env..." -ForegroundColor Yellow
    Copy-Item "env.example" ".env"
    Write-Host "Veuillez configurer les variables d'environnement dans le fichier .env" -ForegroundColor Yellow
}

# Deployer en mode preview
Write-Host "Deploiement en mode preview..." -ForegroundColor Yellow
netlify deploy
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erreur lors du deploiement preview" -ForegroundColor Red
    exit 1
}

# Demander confirmation pour le deploiement en production
Write-Host ""
Write-Host "Deploiement preview reussi!" -ForegroundColor Green
$confirm = Read-Host "Voulez-vous deployer en production? (o/n)"

if ($confirm -eq "o" -or $confirm -eq "O") {
    Write-Host "Deploiement en production..." -ForegroundColor Yellow
    netlify deploy --prod
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors du deploiement en production" -ForegroundColor Red
        exit 1
    }
    Write-Host "Deploiement en production reussi!" -ForegroundColor Green
} else {
    Write-Host "Deploiement en production annule" -ForegroundColor Blue
}

Write-Host ""
Write-Host "Prochaines etapes:" -ForegroundColor Cyan
Write-Host "1. Configurer les variables d'environnement dans Netlify Dashboard" -ForegroundColor White
Write-Host "2. Tester l'application sur l'URL fournie" -ForegroundColor White
Write-Host "3. Verifier les fonctionnalites d'authentification et crypto" -ForegroundColor White
Write-Host ""
Write-Host "Votre application est maintenant en ligne!" -ForegroundColor Green
