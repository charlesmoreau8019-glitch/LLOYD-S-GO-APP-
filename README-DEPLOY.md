# Guide de Déploiement Netlify - Lloyds GO!

## 🚀 Déploiement Automatique

Ce dossier contient tous les fichiers nécessaires pour déployer l'application Lloyds GO! sur Netlify.

## 📁 Structure des Fichiers

```
deploy/
├── functions/
│   └── api.js              # Netlify Functions pour l'API backend
├── js/
│   └── apiManager.js       # Gestionnaire d'API client
├── index.html              # Page principale de l'application
├── users.json              # Base de données utilisateurs
├── package.json            # Dépendances Node.js
├── netlify.toml            # Configuration Netlify
├── _redirects              # Redirections SPA
├── env.example             # Variables d'environnement
└── deploy-to-netlify.ps1   # Script de déploiement PowerShell
```

## 🔧 Prérequis

1. **Node.js** (version 18 ou supérieure)
2. **Netlify CLI** installé globalement :
   ```bash
   npm install -g netlify-cli
   ```
3. **Compte Netlify** avec accès au déploiement

## 📋 Étapes de Déploiement

### 1. Préparation

```bash
# Naviguer vers le dossier deploy
cd deploy

# Installer les dépendances
npm install

# Se connecter à Netlify (si pas déjà fait)
netlify login
```

### 2. Configuration des Variables d'Environnement

Créer un fichier `.env` basé sur `env.example` :

```bash
cp env.example .env
```

Modifier le fichier `.env` avec vos valeurs :

```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise
COINGECKO_API_URL=https://api.coingecko.com/api/v3
COINMARKETCAP_API_KEY=votre-cle-api-coinmarketcap
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
```

### 3. Déploiement Automatique

#### Option A : Script PowerShell (Windows)
```powershell
.\deploy-to-netlify.ps1
```

#### Option B : Déploiement Manuel
```bash
# Déployer en mode preview
netlify deploy

# Déployer en production
netlify deploy --prod
```

### 4. Configuration sur Netlify Dashboard

1. Aller sur [Netlify Dashboard](https://app.netlify.com)
2. Sélectionner votre site
3. Aller dans **Site settings > Environment variables**
4. Ajouter les variables d'environnement :
   - `JWT_SECRET`
   - `COINMARKETCAP_API_KEY`
   - `NODE_ENV=production`

## 🌐 Fonctionnalités Déployées

### ✅ API Backend (Netlify Functions)
- **Authentification** : Login/Register avec JWT
- **Gestion des utilisateurs** : Profil, mise à jour
- **Crypto** : Prix en temps réel, achats/ventes
- **Sécurité** : Rate limiting, CORS, Helmet

### ✅ Frontend
- **Interface moderne** : Design responsive
- **Gestion d'état** : LocalStorage pour l'authentification
- **API Manager** : Communication avec les Netlify Functions
- **PWA Ready** : Manifest et service workers

### ✅ Configuration
- **Redirections SPA** : Toutes les routes vers index.html
- **Headers de sécurité** : CSP, CORS, etc.
- **Optimisation** : Compression, cache

## 🔍 Test du Déploiement

### 1. Vérification de l'API
```bash
# Test de santé
curl https://votre-site.netlify.app/.netlify/functions/api/api/health

# Test d'inscription
curl -X POST https://votre-site.netlify.app/.netlify/functions/api/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@test.com","password":"password123"}'
```

### 2. Test de l'Interface
1. Ouvrir l'URL de votre site Netlify
2. Tester l'inscription/connexion
3. Vérifier les fonctionnalités crypto
4. Tester la responsivité mobile

## 🛠️ Développement Local

### Démarrer en mode développement
```bash
# Installer Netlify CLI si pas déjà fait
npm install -g netlify-cli

# Démarrer le serveur de développement
netlify dev
```

L'application sera accessible sur `http://localhost:8888`

### Variables d'environnement locales
Créer un fichier `.env.local` pour le développement :
```env
NODE_ENV=development
JWT_SECRET=dev-secret-key
COINGECKO_API_URL=https://api.coingecko.com/api/v3
```

## 🔧 Dépannage

### Erreurs Courantes

1. **Erreur 404 sur les API**
   - Vérifier que les Netlify Functions sont déployées
   - Contrôler le fichier `netlify.toml`

2. **Erreur CORS**
   - Vérifier les origines autorisées dans `functions/api.js`
   - Contrôler les headers dans `netlify.toml`

3. **Erreur d'authentification**
   - Vérifier la variable `JWT_SECRET`
   - Contrôler les tokens dans le localStorage

### Logs de Débogage
```bash
# Voir les logs des fonctions
netlify functions:list
netlify functions:invoke api --no-identity

# Logs du site
netlify logs
```

## 📊 Monitoring

### Métriques à Surveiller
- **Performance** : Temps de chargement des pages
- **Erreurs** : Logs des Netlify Functions
- **Utilisation** : Nombre d'invocations des fonctions
- **Sécurité** : Tentatives d'accès non autorisées

### Outils Recommandés
- **Netlify Analytics** : Métriques de performance
- **Sentry** : Monitoring des erreurs
- **Google Analytics** : Trafic utilisateur

## 🔄 Mise à Jour

### Déploiement d'une Nouvelle Version
1. Modifier le code dans le dossier `deploy/`
2. Tester localement avec `netlify dev`
3. Déployer avec `netlify deploy --prod`
4. Vérifier les fonctionnalités sur le site en ligne

### Rollback
```bash
# Voir les déploiements précédents
netlify deploy:list

# Revenir à une version précédente
netlify deploy:rollback
```

## 📞 Support

Pour toute question ou problème :
1. Vérifier les logs Netlify
2. Consulter la documentation Netlify Functions
3. Tester en mode développement local
4. Vérifier les variables d'environnement

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀
