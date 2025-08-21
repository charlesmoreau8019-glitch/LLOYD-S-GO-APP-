# Script de déploiement automatique vers Netlify
# Lloyds GO! - Application bancaire et crypto

Write-Host "🚀 Déploiement vers Netlify - Lloyds GO!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

# Vérifier si Netlify CLI est installé
try {
    $netlifyVersion = netlify --version
    Write-Host "✅ Netlify CLI détecté: $netlifyVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Netlify CLI non trouvé. Installation..." -ForegroundColor Red
    Write-Host "Veuillez installer Netlify CLI avec: npm install -g netlify-cli" -ForegroundColor Yellow
    exit 1
}

# Vérifier si nous sommes dans le bon répertoire
if (-not (Test-Path "netlify.toml")) {
    Write-Host "❌ Fichier netlify.toml non trouvé. Veuillez exécuter ce script depuis le dossier deploy." -ForegroundColor Red
    exit 1
}

# Vérifier les dépendances
Write-Host "📦 Vérification des dépendances..." -ForegroundColor Blue
if (-not (Test-Path "node_modules")) {
    Write-Host "📥 Installation des dépendances..." -ForegroundColor Blue
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erreur lors de l'installation des dépendances" -ForegroundColor Red
        exit 1
    }
}

# Vérifier les fichiers essentiels
$requiredFiles = @(
    "index.html",
    "functions/api.js",
    "js/apiManager.js",
    "users.json",
    "netlify.toml"
)

foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "❌ Fichier manquant: $file" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✅ Tous les fichiers requis sont présents" -ForegroundColor Green

# Vérifier la configuration Netlify
Write-Host "🔧 Vérification de la configuration Netlify..." -ForegroundColor Blue

# Créer un fichier .env temporaire pour le déploiement
$envContent = @"
NODE_ENV=production
JWT_SECRET=lloyds-go-production-secret-$(Get-Random)
COINGECKO_API_URL=https://api.coingecko.com/api/v3
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
"@

$envContent | Out-File -FilePath ".env" -Encoding UTF8
Write-Host "✅ Fichier .env créé pour le déploiement" -ForegroundColor Green

# Déploiement vers Netlify
Write-Host "🚀 Déploiement en cours..." -ForegroundColor Blue

try {
    # Déployer avec Netlify CLI
    netlify deploy --prod --dir=.
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Déploiement réussi!" -ForegroundColor Green
        Write-Host "🌐 Votre application est maintenant en ligne sur Netlify" -ForegroundColor Green
        
        # Afficher les informations du site
        Write-Host "📋 Pour voir les informations du site, exécutez: netlify status" -ForegroundColor Blue
        
    } else {
        Write-Host "❌ Erreur lors du déploiement" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "❌ Erreur lors du déploiement: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
} finally {
    # Nettoyer le fichier .env temporaire
    if (Test-Path ".env") {
        Remove-Item ".env"
        Write-Host "🧹 Fichier .env temporaire supprimé" -ForegroundColor Blue
    }
}

Write-Host "🎉 Déploiement terminé avec succès!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
