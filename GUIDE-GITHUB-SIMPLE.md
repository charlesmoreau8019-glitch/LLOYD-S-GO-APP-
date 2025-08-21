# 🚀 Guide Simple - Ajouter Lloyds GO! sur GitHub

## 📋 Étapes à Suivre

### **Étape 1 : Installer Git**
1. **Allez sur** : https://git-scm.com/download/win
2. **Cliquez** sur "Click here to download"
3. **Téléchargez** le fichier .exe
4. **Double-cliquez** sur le fichier téléchargé
5. **Suivez** l'assistant d'installation (cliquez "Next" partout)
6. **Redémarrez** PowerShell

### **Étape 2 : Créer un Compte GitHub**
1. **Allez sur** : https://github.com
2. **Cliquez** "Sign up"
3. **Remplissez** :
   - Email
   - Mot de passe
   - Nom d'utilisateur
4. **Vérifiez** votre email
5. **Complétez** le questionnaire (optionnel)

### **Étape 3 : Créer le Repository**
1. **Connectez-vous** sur GitHub
2. **Cliquez** sur le bouton "+" en haut à droite
3. **Sélectionnez** "New repository"
4. **Remplissez** :
   - **Repository name** : `lloyds-go-app`
   - **Description** : `Application bancaire et crypto moderne`
   - **Choisissez** "Public"
   - **NE cochez PAS** "Add a README file"
   - **NE cochez PAS** "Add .gitignore"
5. **Cliquez** "Create repository"

### **Étape 4 : Exécuter le Script Automatique**
1. **Ouvrez** PowerShell dans le dossier `deploy`
2. **Exécutez** cette commande :
   ```powershell
   .\setup-github-complet.ps1
   ```
3. **Suivez** les instructions du script
4. **Entrez** vos informations quand demandé

## 🎯 Ce que fait le Script

Le script `setup-github-complet.ps1` va :

✅ **Vérifier** si Git est installé  
✅ **Configurer** Git avec vos informations  
✅ **Initialiser** le repository local  
✅ **Ajouter** tous vos fichiers  
✅ **Créer** le premier commit  
✅ **Connecter** à GitHub  
✅ **Pousser** les fichiers vers GitHub  

## 📁 Fichiers qui seront sur GitHub

```
lloyds-go-app/
├── 📄 index.html                 # Dashboard principal
├── 📄 admin.html                 # Administration
├── 📄 register.html              # Inscription
├── 📄 package.json              # Dépendances
├── 📄 vercel.json               # Configuration Vercel
├── 📄 env.example               # Variables d'environnement
├── 📁 functions/
│   └── 📄 api.js                # API Backend
├── 📁 js/
│   ├── 📄 apiManager.js
│   ├── 📄 balanceManager.js
│   └── 📄 userManager.js
├── 📁 models/
│   ├── 📄 User.js
│   └── 📄 Transaction.js
└── 📄 users.json                # Base de données
```

## 🚨 En Cas de Problème

### **Git non reconnu**
- Redémarrez PowerShell après l'installation
- Vérifiez que Git est bien installé

### **Erreur d'authentification GitHub**
- Utilisez votre nom d'utilisateur GitHub
- Utilisez votre mot de passe GitHub
- Ou créez un token d'accès personnel

### **Erreur de connexion**
- Vérifiez votre connexion internet
- Vérifiez l'URL du repository

## ✅ Vérification Finale

Après avoir exécuté le script, vérifiez que :

1. **Votre repository existe** sur GitHub
2. **Tous les fichiers sont présents**
3. **L'URL est correcte** : `https://github.com/VOTRE-USERNAME/lloyds-go-app`

## 🚀 Prochaines Étapes

Une fois sur GitHub :
1. **Connectez Vercel** pour le déploiement
2. **Configurez** les variables d'environnement
3. **Testez** votre application en ligne

---

**Lloyds GO!** - Prêt pour le déploiement ! 🚀
