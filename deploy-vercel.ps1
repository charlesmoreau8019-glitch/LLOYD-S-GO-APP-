# Script de Deploiement Vercel Gratuit - Lloyds GO!
# Ce script automatise le deploiement de l'application sur Vercel

Write-Host "Deploiement Vercel Gratuit - Lloyds GO!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# Verifier si Node.js est installe
try {
    $nodeVersion = node --version
    Write-Host "Node.js detecte: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "Node.js n'est pas installe. Veuillez l'installer depuis https://nodejs.org/" -ForegroundColor Red
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

# Verifier si l'utilisateur est connecte a Vercel
Write-Host "Verification de la connexion Vercel..." -ForegroundColor Yellow
try {
    vercel whoami
} catch {
    Write-Host "Connexion a Vercel requise..." -ForegroundColor Yellow
    vercel login
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Erreur lors de la connexion a Vercel" -ForegroundColor Red
        exit 1
    }
}

# Deployer sur Vercel
Write-Host "Deploiement sur Vercel..." -ForegroundColor Yellow
vercel --prod
if ($LASTEXITCODE -ne 0) {
    Write-Host "Erreur lors du deploiement Vercel" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Deploiement Vercel reussi!" -ForegroundColor Green
Write-Host ""
Write-Host "Prochaines etapes:" -ForegroundColor Cyan
Write-Host "1. Configurer les variables d'environnement dans Vercel Dashboard" -ForegroundColor White
Write-Host "2. Tester l'application sur l'URL fournie" -ForegroundColor White
Write-Host "3. Verifier les fonctionnalites d'authentification et crypto" -ForegroundColor White
Write-Host ""
Write-Host "Votre application est maintenant en ligne gratuitement!" -ForegroundColor Green
