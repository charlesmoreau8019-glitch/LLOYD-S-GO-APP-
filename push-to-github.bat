@echo off
echo 🚀 Poussée vers GitHub - Lloyds GO!
echo ========================================

echo.
echo 📋 Configuration Git...
git config --global user.name "Charles Moreau"
git config --global user.email "charles.moreau@example.com"

echo.
echo 🔧 Initialisation du repository...
git init

echo.
echo 📁 Ajout des fichiers...
git add .

echo.
echo 💾 Création du commit...
git commit -m "Initial commit - Lloyds GO! Application complète"

echo.
echo 🌿 Définition de la branche principale...
git branch -M main

echo.
echo 🔗 Ajout du remote GitHub...
git remote add origin https://github.com/charlesmoreau8019-glitch/LLOYD-S-GO-APP-.git

echo.
echo 📤 Poussée vers GitHub...
echo ⚠️  Vous devrez vous authentifier...
git push -u origin main

echo.
echo ✅ Terminé !
echo 🌐 Votre repository: https://github.com/charlesmoreau8019-glitch/LLOYD-S-GO-APP-
echo.
pause
