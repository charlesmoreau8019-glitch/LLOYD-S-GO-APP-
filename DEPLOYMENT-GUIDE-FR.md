# 🌐 Guide de Déploiement Cloud Netlify - Lloyds GO!

## 📋 Étapes pour Faire Fonctionner le Cloud

### 1. **Inscription Netlify (Gratuit)**

1. Aller sur [netlify.com](https://netlify.com)
2. Cliquer sur "Sign up" (Inscription)
3. Choisir "Sign up with GitHub" (recommandé)
4. Autoriser l'accès à votre compte GitHub

### 2. **Création du Site**

#### Option A : Déploiement depuis GitHub (Recommandé)
1. Dans Netlify Dashboard, cliquer sur "New site from Git"
2. Choisir votre repository GitHub
3. Sélectionner le dossier `deploy/` comme dossier de build
4. Configurer :
   - **Build command** : `npm install`
   - **Publish directory** : `.`
   - **Base directory** : `deploy`

#### Option B : Déploiement Manuel
1. Aller dans le dossier `deploy/` de votre projet
2. Exécuter le script PowerShell :
   ```powershell
   .\deploy-to-netlify.ps1
   ```

### 3. **Configuration des Variables d'Environnement**

Dans Netlify Dashboard > Site settings > Environment variables :

```env
NODE_ENV=production
JWT_SECRET=votre-secret-jwt-super-securise-123456
COINGECKO_API_URL=https://api.coingecko.com/api/v3
COINMARKETCAP_API_KEY=votre-cle-api-coinmarketcap
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
LOG_LEVEL=info
```

### 4. **Test du Déploiement**

Votre site sera accessible sur : `https://votre-nom-site.netlify.app`

## 🔧 Fonctionnalités Cloud Disponibles

### ✅ API Backend (Netlify Functions)
- Authentification JWT
- Gestion des utilisateurs
- Prix crypto en temps réel
- Sécurité et rate limiting

### ✅ Base de Données
- Stockage JSON persistant
- Synchronisation automatique
- Sauvegarde automatique

### ✅ Fonctionnalités Avancées
- HTTPS automatique
- CDN global
- Déploiement automatique
- Rollback facile

## 🚀 Démarrage Rapide

### 1. Préparer le Déploiement
```bash
cd deploy
npm install
```

### 2. Déployer
```bash
# Installer Netlify CLI
npm install -g netlify-cli

# Se connecter
netlify login

# Déployer
netlify deploy --prod
```

### 3. Tester
- Ouvrir l'URL fournie par Netlify
- Tester l'inscription/connexion
- Vérifier les fonctionnalités crypto

## 🔍 Vérification du Fonctionnement

### Test de l'API
```bash
curl https://votre-site.netlify.app/.netlify/functions/api/api/health
```

### Test de l'Interface
1. Aller sur votre site Netlify
2. Créer un compte utilisateur
3. Tester la gestion des soldes
4. Vérifier les prix crypto

## 🛠️ Dépannage

### Erreurs Courantes

1. **Erreur 404 sur les API**
   - Vérifier que les Netlify Functions sont déployées
   - Contrôler le fichier `netlify.toml`

2. **Erreur CORS**
   - Vérifier les origines autorisées
   - Contrôler les variables d'environnement

3. **Erreur d'authentification**
   - Vérifier la variable `JWT_SECRET`
   - Contrôler les tokens

## 📞 Support

Pour toute question :
1. Vérifier les logs Netlify
2. Consulter la documentation
3. Tester en mode développement local

---

**Lloyds GO!** - Application bancaire et crypto moderne 🚀
