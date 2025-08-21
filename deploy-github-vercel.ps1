# Script de Deploiement GitHub + Vercel - Lloyds GO!
# Ce script automatise le deploiement complet

Write-Host "Deploiement GitHub + Vercel - Lloyds GO!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# Verifier si Node.js est installe
try {
    $nodeVersion = node --version
    Write-Host "Node.js detecte: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "Node.js n'est pas installe. Veuillez l'installer depuis https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Verifier si Git est installe
try {
    $gitVersion = git --version
    Write-Host "Git detecte: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "Git n'est pas installe. Veuillez l'installer depuis https://git-scm.com/" -ForegroundColor Red
    exit 1
}

# Verifier si Vercel CLI est installe
try {
    $vercelVersion = vercel --version
    Write-Host "Vercel CLI detecte: $vercelVersion" -ForegroundColor Green
} catch {
    Write-Host "Installation de Vercel CLI..." -ForegroundColor Yellow
    npm install -g vercel
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de l'installation de Vercel CLI" -ForegroundColor Red
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

# Initialiser Git si pas deja fait
if (-not (Test-Path ".git")) {
    Write-Host "Initialisation de Git..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial commit - Lloyds GO! Application"
}

# Verifier si l'utilisateur est connecte a Vercel
Write-Host "Verification de la connexion Vercel..." -ForegroundColor Yellow
try {
    vercel whoami
} catch {
    Write-Host "Connexion a Vercel requise..." -ForegroundColor Yellow
    Write-Host "Une fenetre de navigateur va s'ouvrir pour la connexion..." -ForegroundColor Cyan
    vercel login
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de la connexion a Vercel" -ForegroundColor Red
        exit 1
    }
}

# Deployer sur Vercel
Write-Host "Deploiement sur Vercel..." -ForegroundColor Yellow
Write-Host "Configuration automatique en cours..." -ForegroundColor Cyan

# Deployer en production
vercel --prod --yes
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erreur lors du deploiement Vercel" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Deploiement reussi!" -ForegroundColor Green
Write-Host ""
Write-Host "Prochaines etapes:" -ForegroundColor Cyan
Write-Host "1. Configurer les variables d'environnement dans Vercel Dashboard" -ForegroundColor White
Write-Host "2. Tester l'application sur l'URL fournie" -ForegroundColor White
Write-Host "3. Verifier les fonctionnalites d'authentification et crypto" -ForegroundColor White
Write-Host "4. Tester les pages admin" -ForegroundColor White
Write-Host ""
Write-Host "Votre application est maintenant en ligne avec toutes les fonctionnalites!" -ForegroundColor Green
