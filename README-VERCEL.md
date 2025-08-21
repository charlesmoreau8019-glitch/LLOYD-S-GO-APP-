# 🚀 Déploiement Vercel - Lloyds GO!

## 📋 Structure des Fichiers

```
deploy/
├── 📄 index.html                 # Dashboard principal
├── 📄 admin.html                 # Administration générale
├── 📄 admin-balance.html         # Gestion des soldes
├── 📄 admin-complete.html        # Administration complète
├── 📄 admin-simple.html          # Administration simple
├── 📄 register.html              # Page d'inscription
├── 📄 test-admin-access.html     # Page de test
├── 📄 vercel.json               # Configuration Vercel
├── 📄 package.json              # Dépendances Node.js
├── 📄 env.example               # Variables d'environnement
├── 📁 functions/
│   └── 📄 api.js                # API Backend (Serverless Functions)
├── 📁 js/
│   ├── 📄 apiManager.js         # Gestionnaire API
│   ├── 📄 balanceManager.js     # Gestion des soldes
│   ├── 📄 userManager.js        # Gestion des utilisateurs
│   └── 📄 cryptoPriceUpdater.js # Mise à jour des prix crypto
├── 📁 models/
│   ├── 📄 User.js               # Modèle utilisateur
│   ├── 📄 Transaction.js        # Modèle transaction
│   └── 📄 CryptoBalance.js      # Modèle solde crypto
├── 📁 middleware/
│   ├── 📄 auth.js               # Middleware d'authentification
│   └── 📄 errorHandler.js       # Gestionnaire d'erreurs
├── 📁 utils/
│   └── 📄 logger.js             # Système de logs
└── 📄 users.json                # Base de données utilisateurs
```

## 🌟 Fonctionnalités Incluses

### **✅ Dashboard Principal**
- Interface moderne et responsive
- Navigation intuitive
- Statistiques en temps réel
- Gestion des utilisateurs

### **✅ Pages d'Administration**
- **admin.html** : Vue d'ensemble du système
- **admin-balance.html** : Gestion des soldes en temps réel
- **admin-complete.html** : Administration complète
- **admin-simple.html** : Interface simplifiée

### **✅ API Backend (Serverless Functions)**
- Authentification JWT
- Gestion des utilisateurs
- API crypto (CoinGecko)
- Gestion des soldes
- Sécurité et rate limiting

### **✅ Fonctionnalités Avancées**
- Synchronisation temps réel
- Export des données
- Actions en masse
- Interface responsive
- HTTPS automatique

## 🚀 Étapes de Déploiement

### **1. Préparer GitHub**
1. Créer un repository GitHub
2. Pousser tous les fichiers du dossier `deploy/`
3. Vérifier que la structure est correcte

### **2. Déployer sur Vercel**
1. Aller sur [vercel.com](https://vercel.com)
2. S'inscrire avec GitHub
3. Importer le repository
4. Configurer les variables d'environnement
5. Déployer

### **3. Configuration Post-Déploiement**
1. Configurer les variables d'environnement
2. Tester toutes les fonctionnalités
3. Vérifier les pages admin
4. Configurer un domaine personnalisé (optionnel)

## 🌐 URLs de l'Application

### **URLs Principales**
```
https://votre-projet.vercel.app/              # Dashboard principal
https://votre-projet.vercel.app/admin.html    # Administration générale
https://votre-projet.vercel.app/admin-balance.html  # Gestion des soldes
https://votre-projet.vercel.app/admin-complete.html # Administration complète
https://votre-projet.vercel.app/admin-simple.html   # Administration simple
https://votre-projet.vercel.app/register.html       # Inscription
https://votre-projet.vercel.app/test-admin-access.html # Test
```

### **API Backend**
```
https://votre-projet.vercel.app/api/health    # Test de santé
https://votre-projet.vercel.app/api/auth/register  # Inscription
https://votre-projet.vercel.app/api/auth/login     # Connexion
https://votre-projet.vercel.app/api/users          # Gestion utilisateurs
https://votre-projet.vercel.app/api/crypto         # Prix crypto
```

## 🔧 Configuration

### **Variables d'Environnement**
```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise-123456789
COINGECKO_API_URL=https://api.coingecko.com/api/v3
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
ALLOWED_ORIGINS=https://votre-projet.vercel.app,https://localhost:8888
```

## 🧪 Tests

### **Test de l'API**
```bash
curl https://votre-projet.vercel.app/api/health
```

### **Test d'Inscription**
```bash
curl -X POST https://votre-projet.vercel.app/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "password123"
  }'
```

## 📊 Avantages Vercel

- ✅ **100% Gratuit** pour les projets personnels
- ✅ **Serverless Functions** incluses
- ✅ **Déploiement automatique** depuis GitHub
- ✅ **Performance excellente** avec CDN global
- ✅ **HTTPS automatique**
- ✅ **Domaines personnalisés** gratuits
- ✅ **Analytics** inclus
- ✅ **Support** gratuit

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀
