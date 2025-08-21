@echo off
echo 🚀 Démarrage du serveur de développement Netlify - Lloyds GO!
echo ================================================================

REM Vérifier si Node.js est installé
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js n'est pas installé. Veuillez l'installer depuis https://nodejs.org/
    pause
    exit /b 1
)

REM Vérifier si Netlify CLI est installé
netlify --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📥 Installation de Netlify CLI...
    npm install -g netlify-cli
    if %errorlevel% neq 0 (
        echo ❌ Erreur lors de l'installation de Netlify CLI
        pause
        exit /b 1
    )
)

REM Vérifier si les dépendances sont installées
if not exist "node_modules" (
    echo 📦 Installation des dépendances...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ Erreur lors de l'installation des dépendances
        pause
        exit /b 1
    )
)

REM Créer le fichier .env s'il n'existe pas
if not exist ".env" (
    echo 🔧 Création du fichier .env...
    copy env.example .env
    echo ✅ Fichier .env créé. Veuillez le configurer avec vos variables d'environnement.
)

echo ✅ Configuration terminée
echo 🌐 Démarrage du serveur de développement...
echo 📍 L'application sera accessible sur: http://localhost:8888
echo.

REM Démarrer le serveur Netlify
netlify dev

echo.
echo 🛑 Serveur arrêté
pause
